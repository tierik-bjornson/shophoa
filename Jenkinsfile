pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'  
        IMAGE_NAME = 'tien2k3/shophoa' 
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/tierik-bjornson/shophoa.git'
            }
        }

    //    stage('OWASP Dependency Check') {
    //         steps {
    //             script {
    //               sh """
    //               docker run --rm \
    //               -v \$(pwd):/src \
    //               -v owasp-data:/usr/share/dependency-check/data \
    //               owasp/dependency-check:latest \
    //               --scan /src \
    //               --format ALL \
    //               --out /src
    //              """
    //             }
    //         }
    //     }

        stage('Build Docker Image') {
            steps {
                script {
                    def buildTag = "${env.BUILD_NUMBER}"
                    def latestTag = "latest"
                    docker.build("${IMAGE_NAME}:${buildTag}")
                    docker.build("${IMAGE_NAME}:${latestTag}")
                }
            }
        }

    

        stage('Login to Docker Hub') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        echo "Logged in to Docker Hub"
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        docker.image("${IMAGE_NAME}:${env.BUILD_NUMBER}").push()
                        docker.image("${IMAGE_NAME}:latest").push()
                    }
                }
            }
        }

        stage('Trivy Scan Docker Image') {
    steps {
        script {
            docker.image('aquasec/trivy:latest').inside('--entrypoint=""') {
                sh """
                    mkdir -p trivy-reports
                    chmod -R 777 trivy-reports

                    # Scan image, chỉ lọc HIGH và CRITICAL, xuất JSON
                    trivy image --format json --severity HIGH,CRITICAL --output trivy-reports/backend.json ${IMAGE_NAME}:${BUILD_NUMBER} || { echo "Scan failed"; exit 1; }

                    # Convert JSON sang HTML report
                    # Truyền template HTML có sẵn (html.tpl)
                    trivy convert --format template --template @trivy-reports/html.tpl --output trivy-reports/backend.html trivy-reports/backend.json || { echo "Convert to HTML failed"; exit 1; }
                """

                // In ra console report JSON để xem nhanh
                sh "cat trivy-reports/backend.json"

                // Archive cả hai report
                archiveArtifacts artifacts: 'trivy-reports/backend.*', fingerprint: true
            }
        }
    }
}




    }

    post {
        always {
            cleanWs()
        }
    }
}
