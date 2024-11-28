#!groovy

pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
    }
    agent {
        dockerfile {
            label "docker"
            args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/home/jenkins/.m2"
        }
    }

    stages {
        stage("Build") {
            steps {
                sh "ssh -V"
                sh "echo $JAVA_HOME"
                sh "mvn -version"
                sh "echo id = `id`"
                sh "ls -la /home/jenkins/.m2"
		sh "sudo chown -R jenkins /home/jenkins/.m2"
		sh "ls -la /home/jenkins/.m2"
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