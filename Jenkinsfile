pipeline {
    agent any

    stages {

        stage('Checkout SCM') {
            steps {
            withCredentials([usernamePassword(credentialsId: 'global--github-creds', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]){
                    checkout scm: [
                        $class: 'GitSCM',
                        branches: [[name: 'hervlokossou']]
                    ]
                }
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
            steps {
                withCredentials([usernamePassword(credentialsId: 'global--github-creds', usernameVariable: 'GIT_USERNAME', passwordVariable: 'GIT_PASSWORD')]) {
                    sh 'git config --global user.name "${GIT_USERNAME}"'
                    sh 'git config --global user.password "${GIT_PASSWORD}"'
                    sh 'git checkout hervlokossou'
                    sh 'make bump-patch'
                    sh 'git push origin refs/remotes/origin/hervlokossou'
                    sh 'git push origin --tags'
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