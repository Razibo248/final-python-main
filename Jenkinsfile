pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        git(credentialsId: 'github-secret', url: 'https://github.com/raziel248/final-python-main.git', branch: 'main')
      }
    }

    stage('Build') {
      steps {
        sh 'docker build -t razbo/final-python-main:latest .'
      }
    }

    stage('Test') {
      steps {
        sh 'docker run --rm razbo/final-python-main:latest python --version'
      }
    }

    stage('Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dhcred', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
          sh '''docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD
docker push razbo/final-python-main:latest'''
        }
      }
    }

  }
}