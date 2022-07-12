if User.find_by_email('palo@alto.com').nil?
  user = User.create!(email: 'palo@alto.com',
               password: '123456789',
               password_confirmation: '123456789')
  user.add_role :admin
end

if User.find_by_email('jalo@alto.com').nil?
  user = User.create!(email: 'jalo@alto.com',
               password: '123456789',
               password_confirmation: '123456789')
end

