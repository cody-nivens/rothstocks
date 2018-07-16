$redis = Redis::Namespace.new("rothstock", :redis => Redis.new(host: ENV['REDIS_URL'], port: ENV['REDIS_PORT']))
