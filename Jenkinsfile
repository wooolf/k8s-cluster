pipeline {
    agent { docker { 
        image 'ansible/ansible:ubuntu1404'
        } }
    stages {
        stage('build') {
            steps {
                sh 'ansible --version'
                // sh 'sleep 100000'
            }
        }
    }
}