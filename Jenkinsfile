#!groovy

pipeline {

    environment {
        JAVA_TOOL_OPTIONS = "-Duser.home=/home/jenkins"
	TOKEN="sqa_cfc6ac97954a594f273e7b7165bbfc99610bb9b1"
    }
    agent {
        dockerfile {
          args "-v /tmp/maven:/home/jenkins/.m2 -e MAVEN_CONFIG=/home/jenkins/.m2 -e TOKEN=$TOKEN"
        }
	label "docker"
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

       stage("SonarQube Analysis") {
            steps {
              	withSonarQubeEnv('My SonarQube Server') {
                 sh 'mvn -e package sonar:sonar'
             	}
               // sh "echo Sonar Test..." 
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

        


	//stage("Ask Question on Merge") {
           // steps {
        	//script {
             //def userInput = input(id: 'userInput', message: 'Merge to?',
             //parameters: [[$class: 'ChoiceParameterDefinition', defaultValue: 'strDef', 
               // description:'List of our branches', name:'Which Branch to Merge', choices: "QA\nUAT\nProduction\nDevelop\nMaster"]
             //])
	     //println(env.GIT_BRANCH) ; 
	     // write logic to merge to X based on userInput	
             // sh "git checkout Developer";
             // echo sh "git merge " + env.GIT_BRANCH.replace("origin/",""); 
             //println(userInput); //Use this value to branch to different logic if needed
        //}
    //}

       // }

    }

    post {
        always {
            cleanWs()
        }
    }
}