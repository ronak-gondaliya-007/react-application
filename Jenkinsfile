pipeline {
    agent any
   environment {
        DEPLOY_DIR = "C:\\xampp\\htdocs\\hello-world"
        BUILD_DIR = "C:\\ProgramData\\Jenkins\\.jenkins\\workspace\\react-app-pipeline\\dist"
    }
    stages {
        stage('Checkout Code') {
            steps {
                echo "Checking out the code from Git.."
               // git branch: 'master', 
               //url: 'https://github.com/ronak-gondaliya-007/react-application.git'
              checkout changelog: false, poll: false, scm: scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ronak-gondaliya-007/react-application.git']])
            }
        }

        stage('Install Dependencies') {
            steps {
                echo "Installing Node.js dependencies"
                bat 'npm install'
            }
        }

        stage('Build Application') {
            steps {
                echo "Building the React application"
                bat 'npm run build'
            }
        }
    }

    post {
        success {
            echo "Deployment completed successfully!"
             script {
                     // Ensure the deploy directory exists
                    bat """
                        if not exist "${DEPLOY_DIR}" (
                            mkdir "${DEPLOY_DIR}"
                        )
                    """

                    // Clean the deploy directory
                    bat "del /q ${DEPLOY_DIR}\\*.* && rmdir /s /q ${DEPLOY_DIR}"

                    // Recreate the deploy directory after cleaning
                    bat "mkdir ${DEPLOY_DIR}"

                    // Copy the build files to the deploy directory
                    bat "xcopy /E /H /C /Y ${BUILD_DIR}\\* ${DEPLOY_DIR}\\"
                }
        }
        failure {
            echo "Build or deployment failed."
        }
    }
}
