@Library('shared-library') _
import com.utils.*

pipeline {

    agent any

	tools {
        maven "maven3"
    }

    environment {
        registry = "prashant4875/devopsweb"
        registryCredential = 'dockerhub'
    }

    stages{

        stage('Git checkout'){
            steps{
                script{
                    gitCheckout()
                }
            }
        }

        stage('BUILD'){
            steps{
                script{
                    def buildStage = new BuildStage(this)
                    buildStage.execute()
                }
            }
        }

        stage('Docker Build & Push'){
            steps{
                script{
                   // Instantiate DockerUtils class
                    def dockerUtils = new DockerUtils(this)
                    // def buildNumber = env.BUILD_NUMBER
                    // Call the buildAndPushImage method with credentialsId and toolName
                    dockerUtils.buildAndPushImage('docker', 'docker', env.BUILD_NUMBER)
                }
            }
        }
        

        stage('Kubernetes Deploy') {
          steps {
            script{
                def kube = new Kubernetes(this)
                kube.kubernetesDeploy([
                    caCertificate: '',
                    clusterName: '',
                    contextName: '',
                    credentialsId: 'kube8',
                    namespace: '',
                    restrictKubeConfigAccess: false,
                    serverUrl: '',
                    manifestFilePath: 'k8s/devops.yaml',
                    buildNumber: env.BUILD_NUMBER
                ])
            } 
          }
        }

    }


}