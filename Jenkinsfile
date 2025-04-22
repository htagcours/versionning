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
                sh "echo ${BRANCH_NAME}"
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