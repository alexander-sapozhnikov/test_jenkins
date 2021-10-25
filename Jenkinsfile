pipeline{
    agent any
    stages {
        stage("git"){
            steps{
                cleanWs()
                git 'https://github.com/alexander-sapozhnikov/test_jenkins.git'
                sh '''
                    git clone https://github.com/spring-projects/spring-petclinic.git
                    docker build -t my-petia-project .
                '''
            }
        }
    }
}