#!groovy

pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
    }
   agent {
        docker {
            image "maven:3.6.0-jdk-13"
            label "docker"
            args "-v /tmp/maven:/var/maven/.m2 -e MAVEN_CONFIG=/var/maven/.m2"
        }
    }

    stages {
        stage("Build") {
            steps {
                sh "ssh -V"
                sh "mvn -version"
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