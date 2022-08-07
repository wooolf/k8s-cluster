pipeline {
    agent { docker { 
        image 'willhallonline/ansible'
        } }
    stages {
        stage('build') {
            steps {
                // sh 'ansible --version'
                sh 'sleep 100000s'
            }
        }
    }
}