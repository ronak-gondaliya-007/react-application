pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'my-react-app'  // Set your Docker image name here
        DOCKER_TAG = 'latest'          // Tag your image for versioning
        REGISTRY = 'docker.io'         // Docker registry, can be DockerHub or a private registry
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out the code from Git.."
               // git branch: 'master', 
               //url: 'https://github.com/ronak-gondaliya-007/react-application.git'
              checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ronak-gondaliya-007/react-application.git']])
            }
        }

        stage('Build Docker Image using Docker Compose') {
            steps {
                script {
                  bat 'docker-compose -f docker-compose.yml build'
                }
            }
        }

        stage('Run Docker Container using Docker Compose') {
            steps {
                script {
                    // Run the Docker container using Docker Compose
                    bat "docker-compose -f docker-compose.yml up -d"
                }
            }
        }

        stage('Clean up') {
            steps {
                script {
                    // Optional: Clean up old containers/images to save space
                    bat "docker-compose -f docker-compose.yml down"
                }
            }
        }
    }

    post {
        always {
            // Clean up containers after each run (if not already done)
            bat "docker-compose -f docker-compose.yml down"
        }
    }
}
