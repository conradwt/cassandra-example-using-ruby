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
    stage('Test') {
           agent any
           steps {
               sh 'sudo docker-compose down'
               sh 'sudo docker-compose up -d'
               sh 'sudo docker-compose down'
           }
       }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerhubPassword', usernameVariable: 'dockerhubUser')]) {
          sh 'sudo docker push s5tdocker/baserail:latest'
        }
      }
    }
   stage ('Deploy') {
     agent any
           steps {
               script{
                   sh "ansible-playbook  playbook.yaml "
               }
           }
     }
  }
}

