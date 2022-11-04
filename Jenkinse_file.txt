pipeline {
    agent any
    stages {
      stage('version') {
        steps {
          sh 'python3 --vesion'
        }
      }
      stage('hello') {
        steps {
          sh 'python hello.py'
        }
      }
    }    
  }

