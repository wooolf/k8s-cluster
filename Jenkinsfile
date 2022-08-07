pipeline {
    agent { docker { 
        image 'cytopia/ansible:latest-tools'
        args '-e USER=ansible -e MY_UID=1000 -e MY_GID=1000'
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