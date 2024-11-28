#!groovy

pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/tmp/jenkins"
    }
    agent {
        dockerfile {
            label "docker"
            args "-v /tmp/maven2:/tmp/jenkins/.m2 -e MAVEN_CONFIG=/tmp/jenkins/.m2"
        }
    }

    stages {
        stage("Build") {
            steps {
                sh "ssh -V"
                sh "ls -la /home/jenkins" 
 		sh "ls -la /tmp/jenkins" 
                sh "mvn -version"
                sh "mvn clean install"
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}