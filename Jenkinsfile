pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "devsecops-app:v1"
        DOCKER_REGISTRY = "docker.io"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/SanginiMiharia/Delhivery_project.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                script {
                    echo 'Building Docker image...'
                    sh 'docker build -t $DOCKER_REGISTRY/$DOCKER_IMAGE .'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    // Assuming you have test scripts or commands
                    sh './run_tests.sh'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying to Kubernetes...'
                    sh 'kubectl apply -f kubernetes/deployment.yaml'
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete'
        }
    }
}
