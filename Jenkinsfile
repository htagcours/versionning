pipeline {
    agent any

    stages {
        stage ('Checkout') {
            steps {
                sh "git checkout hervlokossou"
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
            steps {
                when { anyOf { branch 'hervlokossou'} }
                sh "make bump-patch"
            }
        }
    }
}