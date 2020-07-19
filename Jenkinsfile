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
               sh 'until nc -vz 0.0.0.0 3000  2>/dev/null; do ;echo "App is not ready, sleeping.";sleep 1;done'
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
           steps {
               script{
                   sh "ansible-playbook  playbook.yml "
               }
           }
     }
  }
}

