#!groovy

pipeline {
    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/root"
    }
    agent {
        dockerfile {
            label "docker"
            args "-v /tmp/maven:/root/.m2 -e MAVEN_CONFIG=/root/.m2"
        }
    }

    stages {
        stage("Build") {
            steps {
                sh "ssh -V"
                sh "ls -la /root/.m2" 
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