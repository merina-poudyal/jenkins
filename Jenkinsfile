pipeline {
    agent any

    environment {
        GIT_BRANCH = 'master'
        GIT_URL = 'https://github.com/merina-poudyal/jenkins.git'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: "${env.GIT_BRANCH}", url: "${env.GIT_URL}"
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t static-image .'
                }
            }
        }
        stage('Stop Existing Container') {
            steps {
                script {
                    sh 'docker stop static-container || true'
                }
            }
        }
        stage('Remove Existing Container') {
            steps {
                script {
                    sh 'docker rm static-container || true'
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d -p 9090:80 --name static-container static-image'
                }
            }
        }
    }
}
