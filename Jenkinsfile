pipeline {
    agent any
  
    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out the code from Git.."
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "Installing Node.js dependencies"
                sh 'npm install'
            }
        }

        stage('Build Application') {
            steps {
                echo "Building the React application"
                sh 'npm run build'
            }
        }
    }

    post {
        success {
            echo "Deployment completed successfully!"
        }
        failure {
            echo "Build or deployment failed."
        }
    }
}
