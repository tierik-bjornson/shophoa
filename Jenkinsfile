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
//         stage('Trivy Scan Docker Image') {
//     steps {
//         script {
//             // 1. Tạo thư mục report và đảm bảo quyền ghi
//             sh "mkdir -p ${WORKSPACE}/trivy-report && chmod 777 ${WORKSPACE}/trivy-report"

//             // 2. Scan image và xuất JSON
//             sh """
//             docker run --rm \
//                 -v /var/run/docker.sock:/var/run/docker.sock \
//                 -v ${WORKSPACE}/trivy-report:/report:Z \
//                 aquasec/trivy image ${IMAGE_NAME}:${BUILD_NUMBER} \
//                 --format json \
//                 --output /report/trivy-image-report.json \
//                 --exit-code 0 \
//                 --severity HIGH,CRITICAL \
//                 --scanners vuln
//             """

//             // 3. Kiểm tra file report
    
//             sh "cat /var/jenkins_home/workspace/flowerShopBackend/trivy-report/trivy-image-report.json"

//             // 4. Archive report
//             archiveArtifacts artifacts: 'trivy-report/**', allowEmptyArchive: true
//         }
//     }
// }
    
    stage('Run Acunetix Scan') {
            steps {
                script {
                   
                    build job: 'acunetix-scan', wait: true
                }
            }
        }
    stage('Run Nessus WAS Scan') {
            steps {
                withCredentials([
                    string(credentialsId: 'accesskey-nessus', variable: 'ACCESS_KEY'),
                    string(credentialsId: 'secretkey-nessus', variable: 'SECRET_KEY')
                ]) {
                    sh '''
                    # Chạy Petstore làm target test
                    docker rm -f petstore || true
                    docker run -d --name petstore -p 8081:8080 swaggerapi/petstore

                    # Chạy Nessus WAS Scanner
                    docker rm -f nessus-was || true
                    docker run --name nessus-was --rm \
                        -v ${WORKSPACE}:/scanner \
                        -e WAS_MODE=cicd \
                        -e ACCESS_KEY=$ACCESS_KEY \
                        -e SECRET_KEY=$SECRET_KEY \
                        tenable/was-scanner:latest \
                        > ${WORKSPACE}/scanner.log 2>&1 || true
                    '''
                }
            }
        }
    
    
    
    
    
    
    
    }

    
       


    

    post {
        always {
            script {
                sh '''
                docker rm -f petstore || true
                docker rm -f nessus-was || true
                docker system prune -f --volumes
                '''
            }

            archiveArtifacts artifacts: 'scanner.log', allowEmptyArchive: true

            publishHTML(target: [
                allowMissing: true,
                alwaysLinkToLastBuild: false,
                keepAll: true,
                reportDir: '.',
                reportFiles: 'tenable_was_scan.html',
                reportName: 'WAS Report'
            ])

            

            cleanWs()
        }
    }
}
