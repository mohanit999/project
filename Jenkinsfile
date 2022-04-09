pipeline {
    agent any

    stages {
        stage('Validate') {
            steps {
                sh 'mvn validate'
            }
        }
        stage('Unit Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -t mohanit999/tomcatProject1 .'
                sh 'docker push mohanit999/tomcatProject1'
            }
        }
        stage('Deploy on Docker Container') {
            steps {
                sh 'docker container run -dt --name JavaCal -p 9000:8080 mohanit999/tomcatProject1'
            }
        }
    }
}
