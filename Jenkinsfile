pipeline {
    agent {
        docker {
            image 'python:3.7'
            args '-u root:root -p 8000:8000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                sh './jenkins/scripts/build.sh'
            }
        }
        stage('Deliver for development') {
            steps {
                sh './jenkins/scripts/test.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }
        stage('Deliver for production') {
            steps {
                input message: 'Deploy to Github page? (Click "Proceed" to continue)'
                sh './jenkins/scripts/deploy-for-production.sh'
            }
        }
    }
}