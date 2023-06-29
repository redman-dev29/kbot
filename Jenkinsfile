pipeline {
    agent any
    environment {
        REPO = 'https://github.com/stas-zinchenko/kbot'
        BRANCH = 'main'
    }
    parameters {
        choice(name: 'OS', choices: ['Linux', 'Darwin', 'Windows', 'All'], description: 'Pick OS')
        choice(name: 'ARCH', choices: ['amd64', 'arm64'], description: 'Pick ARCH')
    }
    stages {
        stage("clone") {
            steps {
            echo 'CLONE REPOSITORY'
                git branch: "${BRANCH}", url: "${REPO}"
            }
        }
        
        stage("Test"){
            steps {
                echo 'Test Begin'
                sh 'make test'
            }
        }

        stage('Linux') {
            steps {
                echo "Build for platform ${params.OS}"
                sh 'make build'
                echo "Build for arch: ${params.ARCH}"                  
            }
        }
    }
}
