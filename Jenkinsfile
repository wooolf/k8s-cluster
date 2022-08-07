pipeline {
    agent { docker { 
        image 'willhallonline/ansible'
        args '-u ansible'
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