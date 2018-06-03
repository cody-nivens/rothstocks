namespace :docker do
  desc "Push docker images to DockerHub"
  task :push_image do
    TAG = 'latest'

    puts "Building Docker image"
    sh "docker build -t -t 127.0.0.1:30400/rothstocks:#{TAG} ."

    IMAGE_ID = `docker images | grep 127.0.0.1:30400\/rothstocks | head -n1 | awk '{print $3}'`.strip

    puts "Tagging latest image"
    sh "docker tag #{IMAGE_ID} -t 127.0.0.1:30400/rothstocks:latest"

    puts "Pushing Docker image"
    sh "docker push -t 127.0.0.1:30400/rothstocks:latest"

    puts "Done"
  end

end
