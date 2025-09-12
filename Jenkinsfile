pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub-credentials'  
        IMAGE_NAME = 'tien2k3/shophoa' 
        IMAGE_TAG = "latest"

        ACX_SERVER_URL = 'https://security.vissoft.vn'
        ACX_API_TOKEN  = credentials('acunetix-credentials') 
        ACX_TARGET_ID  = 'a6a0627d-831c-4db6-b1bb-47835757bb23' 

      
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
     stage('Trigger Acunetix Scan') {
            steps {
                script {
                    echo "Triggering Acunetix scan..."
    
                    def scanResponse = sh(
                        script: """
                        curl -s -k -X POST ${ACX_SERVER_URL}/api/v1/scans \\
                            -H "X-Auth: ${ACX_API_TOKEN}" \\
                            -H "Content-Type: application/json" \\
                            -d '{
                                  "target_id": "${ACX_TARGET_ID}",
                                  "schedule": {"disable": false}
                                }'
                        """,
                        returnStdout: true
                    ).trim()
                    echo "Acunetix scan triggered: ${scanResponse}"

                    def json = readJSON text: scanResponse
                    env.ACX_SCAN_ID = json.scan_id
                }
            }
        }

        stage('Fetch Acunetix Report (Optional)') {
            steps {
                script {
                    if (env.ACX_SCAN_ID) {
                        echo "Fetching Acunetix scan report..."
                        def report = sh(
                            script: """
                            curl -s -k -X GET ${ACX_SERVER_URL}/api/v1/reports/${env.ACX_SCAN_ID}/export/json \\
                                -H "X-Auth: ${ACX_API_TOKEN}" \\
                                -H "Content-Type: application/json"
                            """,
                            returnStdout: true
                        ).trim()
                        writeFile file: "acunetix-report-${env.ACX_SCAN_ID}.json", text: report
                        archiveArtifacts artifacts: "acunetix-report-${env.ACX_SCAN_ID}.json", allowEmptyArchive: true
                        echo "Acunetix report saved and archived."
                    } else {
                        echo "No scan_id found, skipping report fetch."
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
