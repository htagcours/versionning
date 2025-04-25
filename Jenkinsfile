pipeline {
    agent any

    stages {

        stage('Checkout scm') {
            steps {
                checkout scm
            }
        }

        stage('Hello') {
            steps {
                echo 'Hello World'
                sh 'git branch'
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
            }
        }

        stage ('Bump version') {
            when { anyOf { branch "hervlokossou";} }
            steps {
                withCredentials([usernamePassword(credentialsId: 'global--github-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "make bump-patch"
                    // sh "git config user.name ${USERNAME}"
                    // sh "git config user.password ${PASSWORD}"
	                // sh "git push --tags"
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