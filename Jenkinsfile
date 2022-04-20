pipeline {
  agent any
  stages {
    stage ('Deploy') {
      steps {
        sh "make ${TF_CMD}"
      }
    }
  }
  post {
    always {
      cleanWs()
    }
  }
}