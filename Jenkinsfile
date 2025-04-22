pipeline {
    agent any

    stages {

        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }

        stage('How') {
            steps {
                echo 'How are you'
            }
        }

        stage('Project init') {
            steps {
                sh "make venv && make install"
                sh "git branch"
            }
        }

        stage ('Bump version') {
            // when { anyOf { branch 'hervlokossou'} }
            steps {
                withCredentials([string(credentialsId: 'global--github-creds', variable: 'TOKEN')]) {
                    sh "make bump-patch"
                }
            }
        }
    }
}