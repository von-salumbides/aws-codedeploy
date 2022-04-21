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
              applicationName: "${CODEDEPLOY_APP_NAME}",
              deploymentConfig: 'CodeDeployDefault.AllAtOnce',
              deploymentGroupAppspec: false,
              deploymentGroupName: "${CODEDEPLOY_GROUP_NAME}",
              region: 'us-east-2',
              s3bucket: "${CODEDEPLOY_S3_BUCKET}",
              s3prefix: "${CODEDEPLOY_S3_PREFIX}",
              waitForCompletion: true,
              pollingTimeoutSec: "3600"])
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