pipeline {
    agent any
    // how often Jenkins will check for changes in github
    // tiggers{
    //     pollSCM('*/1 * * * *')
    // }

    stages {
        stage('build-docker-image') {
            steps {
                build_image()
            }
        }


        stage('deploy-to-dev') {
            steps {
                deploy_to_env("DEV")
            }
        }
        stage('tests-on-dev') {
            steps {
                run_test("DEV")
            }
        }


        stage('deploy-to-stg') {
            steps {
                deploy_to_env("STG")
            }
        }
        stage('tests-on-stg') {
            steps {
                run_test("STG")
            }
        }


        stage('deploy-to-prod') {
            steps {
                deploy_to_env("PROD")
            }
        }
        stage('tests-on-prod') {
            steps {
                run_test("PROD")
            }
        }
    }
}

//______________________METHODS_________________________

def build_image(){
    echo "Building docker image"
    sh "docker build -t ppptdl/python-greetings ."

    echo "Pushing image to docker registry"
    sh "docker push ppptdl/python-greetings"

    echo "Method build_image completed"
}

def deploy_to_env(String env){
    echo "Deploying on ${env} env"

    echo "Method deploy_to_env in ${env} completed"
}

def run_test(String env){
    echo "Testing on ${env} env"

    echo "Method run_test in ${env} completed"
}



