pipeline {
    agent { docker { image 'cytopia/ansible:latest-tools' } }
    stages {
        stage('build') {
            steps {
                sh 'ansible --version'
            }
        }
    }
}