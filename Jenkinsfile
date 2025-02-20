#!groovy

pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
    }
   agent {
        docker {
            image "ssriram12/maven-3.9.9:jdk13"
            label "docker"
            args "-v /tmp/maven:/home/jenkins -e MAVEN_CONFIG=/home/jenkins"
        }
    }

    stages {
        stage("Build") {
            steps {
                // sh "ssh -V"
                sh "mvn -version"
                sh "echo id = `id`"
		sh "sudo mkdir -p /home/jenkins/.m2/repository" 
		sh "sudo chown -R jenkins:jenkins /home/jenkins"
		sh "echo id = `id`"
                sh "mvn clean compile"
            }
        }
	stage("Test") {
            steps {
                sh "mvn test"
            }
        }
	stage("Deploy") {
            steps {
                sh "mvn install"
            }
        }


    }

    post {
        always {
            cleanWs()
        }
    }
}