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


        stage('Docker Build') {
            steps {
                echo 'Création de l\'image Docker...'
                bat 'docker build -t spring-boot-app:v1 .'
            }
        }

        stage('Docker run') {
           steps {
             echo 'lancement'
                bat 'docker compose --project-name backend up -d'
          }
        }
    }
}