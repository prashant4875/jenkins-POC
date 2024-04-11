@Library('shared-library') import com.utils.*

pipeline {

    agent any

	tools {
        maven "maven3"
    }

    environment {
        registry = "imranvisualpath/vproappdock"
        registryCredential = 'dockerhub'
    }

    stages{

        // stage('Git checkout'){
        //     steps{
        //         script{
        //             def gitCheckout = new GitCheckout()
        //             gitCheckout.checkout(branch: 'master', credentialsId: 'github', url: 'https://github.com/prashant4875/jenkins-POC.git')
        //         }
        //     }
        // }

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
                    
                    // Call the buildAndPushImage method with credentialsId and toolName
                    dockerUtils.buildAndPushImage('docker', 'docker')
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
                    credentialsId: 'k8s',
                    namespace: '',
                    restrictKubeConfigAccess: false,
                    serverUrl: '',
                    manifestFilePath: 'k8s/devops.yaml'
                ])
            } 
          }
        }

    }


}