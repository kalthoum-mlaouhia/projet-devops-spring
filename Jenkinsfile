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

    }
}