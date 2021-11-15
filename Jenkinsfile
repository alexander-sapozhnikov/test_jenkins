pipeline{
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}
    stages {
        stage("clone repo"){
            steps{
                sh 'git clone https://github.com/spring-projects/spring-petclinic.git'
            }
        }
        stage("build"){
            steps {
                sh 'docker build -t alexandersapozhnikov/my-petia-project-ready -f Dockerfile .'
            }
        }
        stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}
		
	stage('Push') {

		steps {
			sh 'docker push alexandersapozhnikov/my-petia-project-ready'
		}
	} 
	stage("clean"){
            cleanWs()
        }

    }
}
