pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'
        IMAGE_NAME = 'tien2k3/shophoa'
        IMAGE_TAG = "latest"
        NESSUS_SCRIPT = "/scripts/nessus_scan_run.sh"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/tierik-bjornson/shophoa.git'
            }
        }

        stage('Run OWASP Scan') {
            steps {
                build job: 'flowerOwsapCheck', wait: true
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    def buildTag = "${env.BUILD_NUMBER}"
                    docker.build("${IMAGE_NAME}:${buildTag}")
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', env.DOCKERHUB_CREDENTIALS) {
                        docker.image("${IMAGE_NAME}:${env.BUILD_NUMBER}").push()
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Trigger Nessus Scan') {
            steps {
                sh 'bash /scripts/nessus_scan_run.sh'
            }
        }

        stage('Archive Nessus Report') {
            steps {
                archiveArtifacts artifacts: 'nessus_report.html', fingerprint: true
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        failure {
            echo "Pipeline failed due to High/Critical vulnerabilities!"
        }
        success {
            echo "Pipeline completed successfully, no High/Critical vulnerabilities found."
        }
    }
}
