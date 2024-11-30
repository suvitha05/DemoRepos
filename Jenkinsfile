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
                sh "mvn -version"
                sh "echo id = `id`"
		sh "sudo chown -R jenkins /home/jenkins/.m2"
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
	stage("Ask Question on Merge") {
            steps {
        	script {
             def userInput = input(id: 'userInput', message: 'Merge to?',
             parameters: [[$class: 'ChoiceParameterDefinition', defaultValue: 'strDef', 
                description:'List of our branches', name:'Which Branch to Merge', choices: "QA\nUAT\nProduction\nDevelop\nMaster"]
             ])
	     println(env.GIT_BRANCH) ; 
	     // write logic to merge to X based on userInput	
             // sh "git checkout Developer";
             // echo sh "git merge " + env.GIT_BRANCH.replace("origin/",""); 
             println(userInput); //Use this value to branch to different logic if needed
        }
    }

        }

    }

    post {
        always {
            cleanWs()
        }
    }
}