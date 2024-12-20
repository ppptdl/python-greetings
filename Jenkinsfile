pipeline {
    agent any
    // how often Jenkins will check for changes in github
    // tiggers{
    //     pollSCM('*/1 * * * *')
    // }
    parameters{
        string(name:'greetingsImageName', defaultValue:'peterispp/python-greetings-app:latest', description:'Docker image name')
        string(name:'apiTestImageName', defaultValue:'peterispp/api-tests:latest', description:'Docker image name')
    }
    //this is run sequentially by default
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
    sh "docker build -t ${greetingsImageName} ."

    echo "Pushing image to docker registry"
    sh "docker push ${greetingsImageName}"

    echo "Method build_image completed"
}

def deploy_to_env(String env){
    echo "Deploying on ${env} env"
    sh "docker pull ${greetingsImageName}"
//TODO
    sh "docker compose stop"

    sh "docker compose down"

    sh "docker compose up"


    echo "Method deploy_to_env in ${env} completed"
}

def run_test(String env){
    echo "Testing on ${env} env"
    sh "docker pull ${apiTestImageName}"
    sh "docker run --network=host --rm ${apiTestImageName} run greetings greetings_${env}"

    echo "Method run_test in ${env} completed"
}



