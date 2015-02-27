user = User.new name: 'Admin',
                username: 'admin',
                email: 'admin@application.com',
                password: 'pa55word',
                password_confirmation: 'pa55word',
                admin: true

if user.valid?
  user.save!
  puts 'login with..................'
  puts "username #{user.username}"
  puts 'password pa55word'
else
  print 'F'
end