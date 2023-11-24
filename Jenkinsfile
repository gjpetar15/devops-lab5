pipeline {
    agent any
    parameters {
        string(name: 'DOCKER_IMAGE_NAME', defaultValue: 'flask-app', description: 'flask app for lab5')
    }

    stages {
        stage('Setup') {
            steps {
                sh 'ansible-playbook ansiblepb.yml'
            }
        }
        stage('Build and push docker image') {
            steps {
                withCredentials(usernamePassword(credentialsId: 'dockerhubcred', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')) {
                    sh 'docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}'
                    sh 'docker build -t petar15/${params.DOCKER_IMAGE_NAME} .'
                    sh 'docker push petar15/${params.DOCKER_IMAGE_NAME}'
                    sh 'docker logout'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'ansible-playbook ansible_deploy.yml'
            }
        }
    }
}