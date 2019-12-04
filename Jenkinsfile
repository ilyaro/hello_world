pipeline {
    agent any
    environment {
        PROJECT_ID = 'western-cirrus-260108'
        CLUSTER_NAME = 'standard-cluster-1'
        LOCATION = 'us-central1-a'
        CREDENTIALS_ID = 'gke'
    }
    stages {
        stage("Checkout code") {
            steps {
                checkout scm
            }
        }
        stage("Build image") {
            steps {
                script {
                    sh """
                       cat /etc/*release*
                       ##/usr/bin/docker build gfish/hello_world:${env.BUILD_ID}
                    """
                }
            }
        }
        stage("Push image") {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                            myapp.push("latest")
                            myapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }        
    }    
}
