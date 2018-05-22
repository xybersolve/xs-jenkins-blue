#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('Clean WS') {
            steps {
                echo "Clean Workspace"
                cleanWs()
            }
        }

        stage('Checkout') {
            steps {
              echo "Checkout"
              checkout scm
              // echo "Pull & stash"
              //git 'https://github.com/xybersolve/janky.git'
              //git url:'https://github.com/xybersolve/xs-jinks.git', branch: 'master'
              //stash includes: '**/*', name: 'app'
            }
        }

        stage('Build') {
            steps {
                // unstash 'app'
                echo 'Building..'
                sh 'make build'
            }
        }

        stage('Tag') {
            steps {
                // unstash 'app'
                echo 'Tag & Push..'
                sh 'make tag'
            }
        }

        stage('Docker Push') {
          steps {
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
              sh "make login user=${env.dockerHubUser} pass=${env.dockerHubPassword}"
              sh 'make push'
              //sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
              //sh 'docker push xybersolve/xs-jenkins-blue:latest'
            }
          }
        }

        stage('Post Clean') {
          steps {
              echo "Clean Workspace"
              cleanWs()
          }
        }

        stage('Info') {
            steps {
                echo "JOB_NAME: ${env.JOB_NAME}"
                echo "BUILD_ID: ${env.BUILD_ID}"
                echo "BUILD_NAME: ${env.BUILD_NAME}"
                echo "BUILD_TAG: ${env.BUILD_TAG}"
                echo "BUILD_NUMBER: ${env.BUILD_NUMBER}"
                echo "BUILD_URL: ${env.BUILD_URL}"
                echo "JOB_URL: ${env.JOB_URL}"
                echo "WORKSPACE: ${env.WORKSPACE}"
                echo "JENKINS_URL: ${env.JENKINS_URL}"
                echo "JENKINS_HOME: ${env.JENKINS_HOME}"
                echo "NODE_NAME: ${env.NODE_NAME}"
            }
        }
    }
    post {
      always {
      echo 'Build ran'
    }
    success {
      echo 'Build was successful'
      /*
        mail to: 'xybersolve@gmail.com',
             subject: "Successful Pipeline: ${currentBuild.fullDisplayName}",
             body: "Pipeline executed with ${env.BUILD_URL}"
      */
    }
    failure {
      echo 'Build failed to run'
    }
    unstable {
      echo 'Build was unstable'
    }
    changed {
      echo 'Something changed from the last build'
    }
  }
}
