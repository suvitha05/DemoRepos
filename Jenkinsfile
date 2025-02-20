#!groovy

pipeline {
    
	environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
	TOKEN="sqa_cfc6ac97954a594f273e7b7165bbfc99610bb9b1"

    }

    agent {
        dockerfile {
            label "docker"
            args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/home/jenkins/.m2 -e TOKEN=$TOKEN"
        }
    }

    stages {
       
	 stage("Build") {
            steps {
                sh "ssh -V"
                sh "mvn -version"
                sh "echo id = `id`"
		// sh "sudo chown -R jenkins /home/jenkins/.m2"
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