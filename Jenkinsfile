pipeline{
    agent {
        label 'agent-1'
    }
    environment{
        appVersion = ""
    }
    options{
        timeout(time: 30, unit: 'MINUTES')
        disableConcurrentBuilds()
    }
    stages{
        stage('Read Json Version'){
            steps{
                script{
                    def packageJSON = readJSON file: 'package.json'
                    appVersion = packageJSON.version
                    echo "appVersion:${appVersion}"
                }
            }

        }
        stage('Install Dependencies'){
            steps{
                script{
                    sh"""
                        npm install
                    """
                }
            }
        }
    }
}