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
            }
        }

        stage ('Bump version') {
            when { anyOf { branch 'hervlokossou'} }
            step {
                sh "make bump-patch"
            }
        }
    }
}