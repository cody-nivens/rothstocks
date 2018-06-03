node {

    checkout scm

    env.DOCKER_API_VERSION="1.23"
    
    sh "git rev-parse --short HEAD > commit-id"

    tag = readFile('commit-id').replace("\n", "").replace("\r", "")
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

        sh "kubectl delete -f --namespace default railsapp_setup_job.yaml"
        sh "kubectl create -f --namespace default railsapp_setup_job.yaml"
        sh "kubectl delete -f --namespace default railsapp_service.yaml"
        sh "kubectl create -f --namespace default railsapp_service.yaml"
        sh "sed 's#127.0.0.1:30400/rothstocks:latest#'$BUILDIMG'#' railsapp_deployment.yaml | kubectl apply --namespace default -f -"
        sh "kubectl rollout status deployment/railsapp-deployment"
    }
}
