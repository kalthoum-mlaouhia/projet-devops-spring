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

        stage('Build & Test') {
            steps {
                echo 'Compilation et tests avec Maven...'
                bat 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Création de l\'image Docker...'
                bat 'docker build -t spring-boot-app:latest .'
            }
        }

        stage('Docker Build') {
           steps {
             echo 'lancement'
                bat 'docker run -d -p 8085:8080 --name mon-app-spring spring-boot-app:latest'
          }
        }

    }
}