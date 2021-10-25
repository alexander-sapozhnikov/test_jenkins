pipeline{
    agent any
    stages {
        stage("git"){
            steps{
                cleanWs()
                sh '''
                    git clone https://github.com/spring-projects/spring-petclinic.git
                    docker build -t my-petia-project .
                '''
            }
        }
    }
}