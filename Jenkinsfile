#!/usr/bin/env groovy

node {
  
   
   stage('checkout') {
        checkout scm
    }

    stage('check java') {
        sh "java -version"
    }

    stage('clean') {
      sh "/usr/bin/mvn clean"
    }
  
   stage('packaging') {
        //sh "./mvnw package -Pprod -DskipTests"
        sh "/usr/bin/mvn package -DskipTests"
        archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
    }
  
    /*** 
    stage ('docker build'){
      withCredentials([[$class: "UsernamePasswordMultiBinding", usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS', credentialsId: 'dockerhub_id']]) {
      sh 'docker login --username $DOCKERHUB_USER --password $DOCKERHUB_PASS'
    }
    def serverImage = docker.build('snyamars007/coe-spring-webpromote')
    serverImage.push('latest')
    sh 'docker logout'
   }
   
  ***/
      stage 'notifyKubernetes'
     try{
      //sh "kubectl --kubeconfig=/var/jenkins_home/kubeconfig delete deployment coe-spring-webpromote"
       //sh "helm --kubeconfig=/var/jenkins_home/kubeconfig install coe-spring-webpromote"
     }catch(e){
      println("no prior deployment exists")
     }
     try{
          sh "kubectl --kubeconfig=/var/jenkins_home/kubeconfig delete svc coe-spring-webpromote"   
     }catch(e){
      println("no prior service exists")
     }
   
      sh "sleep 3s"
      sh "kubectl run --kubeconfig=/var/jenkins_home/kubeconfig --image=snyamars007/coe-spring-webpromote:latest coe-spring-webpromote  --port=8091"
      
      sh "kubectl --kubeconfig=/var/jenkins_home/kubeconfig expose deployment coe-spring-webpromote"
     / **/
    
      /***/   
}//end of node
