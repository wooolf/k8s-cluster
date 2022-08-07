pipeline {
    agent none
    stages {
            stage('parallel test') {
            parallel
            {   
                stage('build ansible') {
                    agent { dockerfile true }
                    steps {
                            sh 'ansible --version'
                        }
                }
                stage('build mvn') {
                    agent { docker { image 'maven:3.8.4-openjdk-11-slim' } }
                    steps {
                        sh 'mvn --version'
                    }
                }
                stage('build python alpine') {
                    agent { docker { image 'python:3.10.1-alpine' } }
                    steps {
                        sh 'python --version'
                    }
                }
            }
        }
    }
}
