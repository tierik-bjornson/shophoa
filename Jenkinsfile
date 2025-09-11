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
            sh "mkdir -p ${WORKSPACE}/trivy-report"

            // Scan và xuất JSON trực tiếp, chỉ quan tâm High & Critical
            sh """
            docker run --rm -v /var/run/docker.sock:/var/run/docker.sock \
                -v ${WORKSPACE}/trivy-report:/report \
                aquasec/trivy image ${IMAGE_NAME}:${BUILD_NUMBER} \
                --format json --output /report/trivy-image-report.json \
                --exit-code 0 --severity HIGH,CRITICAL --scanners vuln
            """

            // In ra console
            sh "cat ${WORKSPACE}/trivy-report/trivy-image-report.json"

            // Lưu report Jenkins
            archiveArtifacts artifacts: 'trivy-report/**', allowEmptyArchive: true
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
