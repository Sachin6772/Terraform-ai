pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        timeout(time: 30, unit: 'MINUTES')
        timestamps()
    }

    environment {
        AWS_REGION = credentials('AWS_REGION')
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        TF_LOG = 'INFO'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    echo "Checking out code from dev branch..."
                }
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: 'dev']],
                    userRemoteConfigs: [[
                        url: 'https://github.com/Sachin6772/Terraform-ai.git',
                        credentialsId: 'github-credentials'
                    ]]
                ])
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    echo "Initializing Terraform..."
                    sh '''
                        terraform init -no-color
                    '''
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                script {
                    echo "Validating Terraform configuration..."
                    sh '''
                        terraform validate -no-color
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    echo "Planning Terraform changes..."
                    sh '''
                        terraform plan -input=false -no-color -out=tfplan
                    '''
                }
            }
        }

        stage('Manual Approval') {
            steps {
                script {
                    echo "Waiting for manual approval before applying changes..."
                    input message: 'Do you want to apply Terraform changes?', ok: 'Deploy'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    echo "Applying Terraform configuration..."
                    sh '''
                        terraform apply -input=false -no-color tfplan
                    '''
                }
            }
        }

        stage('Cleanup') {
            steps {
                script {
                    echo "Cleaning up temporary files..."
                    sh '''
                        rm -f tfplan
                    '''
                }
            }
        }
    }

    post {
        always {
            script {
                echo "Pipeline execution completed."
                cleanWs()
            }
        }
        success {
            script {
                echo "Terraform deployment successful!"
            }
        }
        failure {
            script {
                echo "Pipeline failed. Please review the logs above."
            }
        }
    }
}
