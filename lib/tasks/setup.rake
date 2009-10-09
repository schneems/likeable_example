namespace :devise do

  desc 'setup devise example migrating db and creating a default user'
  task :setup => ['db:create', 'db:migrate', 'environment'] do
    user = User.create! do |u|
      u.email = 'test@example.com'
      u.password = 'test123'
      u.password_confirmation = 'test123'
    end
    user.confirm!
    puts 'New user created!'
    puts 'Email   : ' << user.email
    puts 'Password: ' << user.password
  end
end
