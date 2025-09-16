pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'
        IMAGE_NAME = 'tien2k3/shophoa'
        IMAGE_TAG = "latest"
        ACCESS_KEY = credentials('accesskey-nessus')
        SECRET_KEY = credentials('secretkey-nessus')
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

        stage('Run Acunetix Scan') {
            steps {
                build job: 'acunetix-scan', wait: true
            }
        }

        stage('Run Nessus WAS Scan') {
    steps {
        script {
            // Tạo thư mục scanner trong workspace
            sh "mkdir -p ${WORKSPACE}/scanner && chmod -R 777 ${WORKSPACE}/scanner"

            withCredentials([
                string(credentialsId: 'accesskey-nessus', variable: 'ACCESS_KEY'),
                string(credentialsId: 'secretkey-nessus', variable: 'SECRET_KEY')
            ]) {
                sh """
                docker rm -f nessus-was || true
                docker run --name nessus-was \\
                    -v ${WORKSPACE}/scanner:/scanner \\
                    -e WAS_MODE=cicd \\
                    -e ACCESS_KEY=$ACCESS_KEY \\
                    -e SECRET_KEY=$SECRET_KEY \\
                    -e WAS_TARGET_URL=http://34.194.113.231:30080/ \\
                    -e WAS_OUTPUT=/scanner/tenable_was_scan.html \\
                    tenable/was-scanner:latest > ${WORKSPACE}/scanner/scanner.log 2>&1

                cat ${WORKSPACE}/scanner/scanner.log || true
                ls -lh ${WORKSPACE}/scanner/tenable_was_scan.html || true
                """
            }
        }
    }
}
    }

    post {
        always {
            archiveArtifacts artifacts: '*.log', allowEmptyArchive: true
            archiveArtifacts artifacts: 'tenable_was_scan.html', allowEmptyArchive: true

            publishHTML(target: [
                allowMissing: true,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: "${WORKSPACE}",
                reportFiles: 'tenable_was_scan.html',
                reportName: 'WAS Report'
            ])

            cleanWs()
        }
    }
}
