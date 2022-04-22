pipeline {
  agent any 
  options {
    ansiColor("xterm")
    withAWS(credentials: 'AWS_ACCESS_KEY_ID', region: 'us-east-2')
  }
  stages {
    stage("Deploy") {
      environment {
        CODEDEPLOY_APP_NAME   = "devops-poc"
        CODEDEPLOY_GROUP_NAME = "devops-poc"
        CODEDEPLOY_S3_BUCKET  = "devops-poc-bucket"
        CODEDEPLOY_S3_PREFIX  = "artifact"
        AWS_ACCOUNT_ID        = "${AWS_ACCOUNT_ID}"
        AWS_ACCOUNT_ROLE      = "${AWS_ACCOUNT_ROLE}"
      }
      steps {
        script {
          try {
            withAWS(roleAccount: AWS_ACCOUNT_ID, role: AWS_ACCOUNT_ROLE) {
              step([$class: 'AWSCodeDeployPublisher',
              applicationName:        "${CODEDEPLOY_APP_NAME}",
              deploymentGroupName:    "${CODEDEPLOY_GROUP_NAME}",
              s3bucket:               "${CODEDEPLOY_S3_BUCKET}",
              s3prefix:               "${CODEDEPLOY_S3_PREFIX}",
              deploymentConfig:       'CodeDeployDefault.AllAtOnce',
              region:                 'us-east-2',
              deploymentGroupAppspec: false,
              waitForCompletion:      true,
              pollingTimeoutSec:      "3600"])
            }
          }
            catch(e){
              sh "printenv"
              println(e)
            throw e
          }
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