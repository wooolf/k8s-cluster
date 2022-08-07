pipeline {
agent none
stages {
        parallel
        {   
            
            stage('build ansible') {
                agent { dockerfile true }
                steps {
                        sh 'ansible --version'
                        // sh 'sleep 100000s'
                    }
            }
            stage('build mvn') {
                agent { docker { image 'maven:3.8.4-openjdk-11-slim' } }
                steps {
                    sh 'mvn --version'
                }
            }
        }
    }
}
