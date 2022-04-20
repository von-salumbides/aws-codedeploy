pipeline {
  agent any
  stages {
    stage ('Deploy') {
      steps {
        withCredentials([gitUsernamePassword(credentialsId: 'von-salumbides',
          gitToolName: 'git-tool')]) {
          sh "make ${TF_CMD}"
        }
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}