pipeline {
  agent any
  stages {
    stage('SSH connection') {
      steps {
        withCredentials([sshUserPrivateKey(credentialsId: SSH-HOST, keyFileVariable: 'SSH-KEY', usernameVariable: 'SSH-USER'), string(credentialsId: SSH-HOST-IP, variable:'SSH-HOST-IP'),
	usernamePassword(credentialsId: 'DOCKERHUB-CRED', usernameVariable: 'DOCKERHUB-USRNAME', passwordVariable: 'DOCKERHUB-PSWD') {
	sh'''
	  ssh -i $SSH-KEY $SSH-USER@$SSH-HOST-IP "docker login -u $DOCKERHUB-USRNAME -p DOCKERHUB-PSWD"
	  ssh -i $SSH-KEY $SSH-USER@$SSH-HOST-IP "docker pull shabbymax1/test-repo-1:firstimg"
	  ssh -i $SSH-KEY $SSH-USER@$SSH-HOST-IP "docker run -d -p 80:80 shabbymax1/test-repo-1:firstimg"
	  ssh -i $SSH-KEY $SSH-USER@$SSH-HOST-IP "docker logout"
	  ssh -i $SSH-KEY $SSH-USER@$SSH-HOST-IP "docker image prune -af && yes | docker system prune"
	''' 
        }
      }
    }
  }
}
