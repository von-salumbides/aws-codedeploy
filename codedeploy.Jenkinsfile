pipeline {
  agent any 
  stages {
    stage("Deploy") {
      environment {
        CODEDEPLOY_APP_NAME   = "devops-poc"
        CODEDEPLOY_GROUP_NAME = "devops-poc"
        CODEDEPLOY_S3_BUCKET  = "devops-poc-bucket"
        CODEDEPLOY_S3_PREFIX  = "codedeploy"
      }
      steps {
        script {
          try {
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
            catch(e){
              println("Deployment failed")
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