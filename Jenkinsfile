pipeline {
    agent any
    parameters {
        choice(name: 'OS', choices: ['Linux', 'Darwin', 'Windows', 'All'], description: 'Pick OS')
        choice(name: 'ARCH', choices: ['amd64', 'arm64'], description: 'Pick ARCH')

    }
    stages {
        stage('Linux') {
            steps {
                script {
                    sh 'make build'
                    echo "Build for platform ${params.OS}"
                    echo "Build for arch: ${params.ARCH}"
                }
            }
        }
    }
}
