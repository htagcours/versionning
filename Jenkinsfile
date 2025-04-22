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
                withCredentials([usernamePassword(credentialsId: 'global--github-creds', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                    sh "make bump-patch"
                    sh "git push origin hervlokossou"
	                sh "git push origin --tags"
                }
            }
        }
    }
}