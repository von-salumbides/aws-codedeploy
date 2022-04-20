pipeline {
  agent any
  options {
        ansiColor("xterm")
    }
  stages {
    stage ('Deploy') {
      steps {
        currentBuild.displayName = "tf-command-${TF_CMD}"
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
