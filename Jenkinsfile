pipeline{
    agent any
    environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	    	max = 999999999
        	random_num = "${Math.abs(new Random().nextInt(max+1))}"
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
		
		stage ('check work') {
             steps {
                build job: 'run', parameters: [
                string(name: 'id_container', value: "${random_num}"),
                string(name: 'is_stop', value: "yes"),
                ]
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
			steps {
				cleanWs()
			}
		}
		
		stage("clean image"){
			steps {
				sh 'docker rmi alexandersapozhnikov/my-petia-project-ready'
			}
		}

	}
}
