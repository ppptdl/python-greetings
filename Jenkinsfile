pipeline {
    agent any

    stages {
        stage('build-docker-image') {
            steps {
                echo "Building docker image"
            }
        }


        stage('deploy-to-dev') {
            steps {
                echo "Deplyoing to DEV env"
            }
        }
        stage('tests-on-dev') {
            steps {
                echo "Testing on DEV env"
            }
        }


        stage('deploy-to-stg') {
            steps {
                echo "Deplyoing to STG env"
            }
        }
        stage('tests-on-stg') {
            steps {
                echo "Testing on STG env"
            }
        }


        stage('deploy-to-prod') {
            steps {
                echo "Deplyoing to PROD env"
            }
        }
        stage('tests-on-prod') {
            steps {
                echo "Testing on PROD env"
            }
        }
    }
}
