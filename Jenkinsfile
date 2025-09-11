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

        stage('Trivy Scan Docker Image') {
    steps {
        script {
            // Tạo thư mục report trong workspace Jenkins
            sh "mkdir -p ${WORKSPACE}/trivy-report"

            // Chạy Trivy scan
            sh """
            docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
                -v ${WORKSPACE}/trivy-report:/report \
                aquasec/trivy image ${IMAGE_NAME}:${BUILD_NUMBER} \
                --format json \
                --output /report/trivy-image-report.json
            """

            // In ra console
            sh "cat ${WORKSPACE}/trivy-report/trivy-image-report.json"

            // Archive report
            archiveArtifacts artifacts: 'trivy-report/**', allowEmptyArchive: true
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
    }

    post {
        always {
            cleanWs()
        }
    }
}
