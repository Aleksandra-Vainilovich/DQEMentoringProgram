pipeline {
    agent any
    stages {
      stage('Build') {
        steps {
          git branch: 'Module5CI_CD_Basics', url: 'https://github.com/Aleksandra-Vainilovich/DQEMentoringProgram.git'
          sh 'cd Module4ProjectPyTest/Module4PyTest'
          sh 'python3 TestPyTest.py'
        }
      }
      stage('Test') {
        steps {
          sh 'python3 -m pytest -v -s TestPyTest.py --html=report.html'
        }
      }
    }    
  }