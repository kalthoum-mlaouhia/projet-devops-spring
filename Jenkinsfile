pipeline {
    agent any
    tools {
            maven 'maven'
            jdk 'jdk'
        }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('SonarQube Analysis') {
            steps {
                script {
                    def mvnHome = tool 'maven'
                    withSonarQubeEnv('sonar-server') {
                        bat "${mvnHome}\\bin\\mvn clean verify sonar:sonar -Dsonar.projectKey=devops-project"
                    }
                }
            }
        }


        stage('Docker Build') {
            steps {
                echo 'Création de l\'image Docker...'
                bat 'docker build -t spring-boot-app:v1 .'
            }
        }

        stage('Docker run') {
           steps {
             echo 'lancement'
                bat 'docker compose up -d'
          }
        }
    }
}