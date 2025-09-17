pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'
        IMAGE_NAME = 'tien2k3/shophoa'
        IMAGE_TAG = "latest"
        
        NESSUS_SCRIPT = "/home/ubuntu/jenkins_scripts/nessus_scan.py"
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

        // stage('Run Acunetix Scan') {
        //     steps {
        //         build job: 'acunetix-scan', wait: true
        //     }
        // }

        stage('Run Nessus Scan') {
            steps {
                echo "Starting Nessus scan..."
               
                sh "python3 ${NESSUS_SCRIPT}"
            }
        }

        stage('Publish Nessus Report') {
            steps {
                echo "Publishing Nessus HTML report..."
                publishHTML(target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '/home/ubuntu/jenkins_scripts',
                    reportFiles: 'nessus_report.html',
                    reportName: 'Nessus Scan Report'
                ])
            }
        }

        
        
    }

    post {
        always {
           
           

            cleanWs()
        }
    }
}
