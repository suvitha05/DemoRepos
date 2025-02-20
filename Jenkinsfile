#!groovy

pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/var/jenkins_home"
    }
    agent {
        dockerfile {
            label "docker"
            args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/var/jenkins_home/.m2"
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