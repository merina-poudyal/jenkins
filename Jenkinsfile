pipeline {
    agent any

    stages {
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
