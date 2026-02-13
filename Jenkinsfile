pipeline {
    agent any
    tools {
            maven 'maven'
            jdk 'jdk'
        }
    stages {
        stage('Checkout') {
            steps {
                // Récupère le code depuis GitHub
                checkout scm
            }
        }

        stage('Build & Test') {
            steps {
                echo 'Compilation et tests avec Maven...'
                // Utilise Maven pour compiler et tester (nécessite Maven sur la machine Jenkins)
                bat 'mvn clean package'
            }
        }

        stage('Docker Build') {
            steps {
                echo 'Création de l\'image Docker...'
                // Construit l'image Docker en utilisant le Dockerfile
                bat 'docker build -t spring-boot-app:latest .'
            }
        }

        // stage('Docker Push') {
        //     steps {
        //         echo 'Envoi de l\'image vers Docker Hub (optionnel)'
        //         // Ici tu ajouterais docker login et docker push
        //     }
        // }
    }
}