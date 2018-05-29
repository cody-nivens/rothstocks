if User.find_by_email('jalo@alto.com').nil?
  user = User.create!(email: 'jalo@alto.com',
               password: '123456789',
               password_confirmation: '123456789')
end

