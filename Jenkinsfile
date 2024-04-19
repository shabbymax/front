pipeline {
  agent any
  stages {
    stage('SSH connection') {
      steps {
        withCredentials([sshUserPrivateKey(credentialsId: 'SSH-HOST', keyFileVariable: 'SSH_KEY', usernameVariable: 'SSH_USER'), string(credentialsId: 'SSH-HOST-IP', variable:'SSH_HOST_IP'), usernamePassword(credentialsId: 'DOCKERHUB-CRED', usernameVariable: 'DOCKERHUB_USRNAME', passwordVariable: 'DOCKERHUB_PSWD')]){
	sh'''
	  ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@$SSH_HOST_IP "docker login -u $DOCKERHUB_USRNAME -p $DOCKERHUB_PSWD"
	  ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@$SSH_HOST_IP "docker pull shabbymax1/test-repo-1:firstimg"
	  ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@$SSH_HOST_IP "docker run -d -p 80:80 shabbymax1/test-repo-1:firstimg"
	  ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@$SSH_HOST_IP "docker logout"
	  ssh -o StrictHostKeyChecking=no -i $SSH_KEY $SSH_USER@$SSH_HOST_IP "docker image prune -af && yes | docker system prune"
	''' 
        }
      }
    }
  }
}
