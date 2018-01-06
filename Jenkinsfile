pipeline {
    agent {label "slave"}
    stages {
        stage ("Compile"){
            steps {
                sh "./gradlew compileJava"
            }
        }
        stage ("Unit Test"){
            steps {
                sh "./gradlew test"
            }
        }        
    	stage("Code coverage") {
      	    steps {
        	sh "./gradlew jacocoTestReport"
        	publishHTML (target: [
               		reportDir: 'build/reports/jacoco/test/html',
               		reportFiles: 'index.html',
               		reportName: "JaCoCo Report" ])
        	sh "./gradlew jacocoTestCoverageVerification"
      	    }
    	}
    	stage("Static code analisis") {
      	    steps {
        	sh "./gradlew checkstyleMain"
        	publishHTML (target: [
               		reportDir: 'build/reports/checkstyle/',
               		reportFiles: 'main.html',
               		reportName: "Checkstyle Report" ])
      	    }
    	}
	stage("Package"){
	    steps {
		sh "./gradlew build"
	    }
	}
	stage("Docker Build"){
	    steps {
		sh "docker build -t localhost:5000/calculator:1 ."
	    }
	}
	stage("Docker Push"){
	    steps {
		sh "docker push localhost:5000/calculator:1"
	    }
	}
	stage("Deploy to Staging"){
	    steps {
		sh "docker run -d --rm -p 8765:8080 --name calculator localhost:5000/calculator:1"
	    }
	}
        stage("Acceptance test") {
      	    steps {
		sleep 30
		sh "./acceptance_test.sh"
      	    }
    	}	
    }
}
