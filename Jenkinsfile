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
    }
}
