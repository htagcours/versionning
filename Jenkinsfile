pipeline {
    agent any

    stages {
        stage ('Checkout') {
            steps {
                checkout scm
            }
        }

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
            when { anyOf { branch 'hervlokossou'} }
            steps {
                sh "make bump-patch"
            }
        }
    }
}