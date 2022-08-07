pipeline {
    agent { docker { image 'ansible/ansible' } }
    stages {
        stage('build') {
            steps {
                sh 'ansible --version'
            }
        }
    }
}