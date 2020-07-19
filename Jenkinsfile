#!groovy

pipeline {
  agent none
  stages {
    stage('Docker Build') {
      agent any
      steps {
        sh 'sudo docker build -t s5tdocker/baserail:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
          sh "sudo docker login -u ${env.dockerhubUser} -p ${env.dockerhubPassword}"
          sh 'sudo docker push s5tdocker/baserail:latest'
        }
      }
    }
  }
}
