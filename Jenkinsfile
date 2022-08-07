pipeline {
    agent { docker { 
        image 'cytopia/ansible:latest-tools'
        args '-e USER=ansible --name jenkins_ansible'
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