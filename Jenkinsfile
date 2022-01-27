// loading common groovy scripts
@Library('common')
@Library('humn')
import ai.humn.git.Version

def version = "latest"
def new_version = ""
def scmURL

pipeline {
   agent { label 'ec2' }

    stages {
        stage('Versioning') {
            steps {
                script {
                    def version_helper = new ai.humn.git.Version()
                    def current_version = version_helper.getVersion("./")
                    echo "current version ${current_version}"
                    new_version = version_helper.incrementVersion(current_version)
                    echo "new version ${new_version}"
                }
            }
        }
        stage('Tag & Push') {
            when {
                allOf {
                    branch 'master'
                }
            }

            environment {
                    VERSION = "${new_version}"
            }

            steps {
                withCredentials([usernamePassword(credentialsId: 'humn/ci/github/humnrw', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "git remote set-url origin 'https://${USERNAME}:${PASSWORD}@github.com/humn-ai/tf-mod-aws-elasticsearch'"
                    sh "git tag -a ${new_version} -m 'New version ${new_version}'"
                    sh "git push origin ${new_version}"
                }
            }
        }
    }
    post {
        always {
            deleteDir()
        }
    }
}