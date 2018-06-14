node {

    checkout scm

    env.DOCKER_API_VERSION="1.23"
    
    sh "git rev-parse --short HEAD > commit-id"

    tag = 'latest'
    appName = "rothstocks"
    registryHost = "127.0.0.1:30400/"
    imageName = "${registryHost}${appName}:${tag}"
    imageNameTest = "${registryHost}${appName}_test:${tag}"
    env.BUILDIMG=imageName

    stage("Build"){
    
        sh "docker build -t ${imageName} -f ./Dockerfile ./"
        sh "docker build -t ${imageNameTest} -f ./Dockerfile.test ./"
    }
    stage("Push"){

        sh "docker push ${imageName}"
        sh "docker push ${imageNameTest}"
    }
    stage("Test"){
        sh "kubectl delete --namespace app-test -f railsapp_tests_job.yaml"
        sh "kubectl apply --namespace app-test -f railsapp_tests_job.yaml"
        sh "kubectl rollout status --namespace app-test job.batch/tests"
    }
    stage("Deploy"){

        sh "kubectl apply --namespace default -f railsapp_setup_job.yaml"
        sh "kubectl apply --namespace default -f railsapp_service.yaml"
        sh "sed 's#127.0.0.1:30400/rothstocks:latest#'$BUILDIMG'#' railsapp_deployment.yaml | kubectl apply --namespace default -f -"
        sh "kubectl rollout status --namespace default deployment/railsapp-deployment"
    }
}
