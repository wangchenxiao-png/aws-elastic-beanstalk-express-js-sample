pipeline {
    agent any
    stages {
        stage('git checkout') {
            steps {
                script {
                    git(
                        branch: 'main',
                        url: 'git@github.com:wangchenxiao-png/aws-elastic-beanstalk-express-js-sample.git',
                        credentialsId: 'jenkins-ssh-github'
                    )
                }
            }   
        }
        stage('build') {
            steps {
                script {
                    sh "docker build -t web ."
                    sh "docker stop web && docker rm web && docker run -d -p 8085:8080 --name web web"
                }
            } 
        }
        stage('Test') {
            steps {
                echo 'Testing...'
                snykSecurity(
                  snykInstallation: 'snyk',
                  snykTokenId: 'snyk-api-token',
                  severity: 'critical',
                  // place other parameters here
                )
            }
        }
    }
}
