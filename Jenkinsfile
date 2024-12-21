pipeline {
    agent any

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
                deploy_to_env("dev")
            }
        }
        stage('tests-on-dev') {
            steps {
                run_test("dev")
            }
        }


        stage('deploy-to-stg') {
            steps {
                deploy_to_env("stg")
            }
        }
        stage('tests-on-stg') {
            steps {
                run_test("stg")
            }
        }


        stage('deploy-to-prod') {
            steps {
                deploy_to_env("prod")
            }
        }
        stage('tests-on-prod') {
            steps {
                run_test("prod")
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
    sh "docker pull ${params.greetingsImageName}"

    sh "docker compose stop"
    sh "docker compose down"
    sh "docker compose up -d"


    echo "Method deploy_to_env in ${env} completed"
}

def run_test(String env){
    echo "Testing on ${env} env"
    sh "docker pull ${params.apiTestImageName}"
    sh "docker run --network=host --rm ${params.apiTestImageName} run greetings greetings_${env}"


    echo "Method run_test in ${env} completed"
}



