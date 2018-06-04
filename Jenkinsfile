node {

    checkout scm

    env.DOCKER_API_VERSION="1.23"
    
    sh "git rev-parse --short HEAD > commit-id"

    tag = 'latest'
    appName = "rothstocks"
    registryHost = "127.0.0.1:30400/"
    imageName = "${registryHost}${appName}:${tag}"
    env.BUILDIMG=imageName

    stage("Build"){
    
        sh "docker build -t ${imageName} -f ./Dockerfile ./"
    }
    stage("Push"){

        sh "docker push ${imageName}"
    }
    stage("Deploy"){

        sh "kubectl apply --namespace default -f railsapp_setup_job.yaml"
        sh "kubectl apply --namespace default -f railsapp_service.yaml"
        sh "sed 's#127.0.0.1:30400/rothstocks:latest#'$BUILDIMG'#' railsapp_deployment.yaml | kubectl apply --namespace default -f -"
        sh "kubectl rollout status deployment/railsapp-deployment"
    }
}
