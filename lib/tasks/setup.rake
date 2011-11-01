namespace :likeable do

  desc 'setup likeable example migrating db and creating a default user'
  task :setup => ['db:drop', 'db:create', 'db:migrate', 'environment'] do
    user = User.create! do |u|
      u.email = 'user@test.com'
      u.password = 'user123'
      u.password_confirmation = 'user123'
      u.ensure_authentication_token!
    end
    puts 'New user created!'
    puts 'Email   : ' << user.email
    puts 'Password: ' << user.password

    Post.create(:name => "Lorem ipsum dolor sit amet", :content => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus id ipsum tortor, in eleifend lectus. Donec fringilla laoreet mauris a pulvinar. Quisque ultricies tristique tempus. Vivamus vel mi sit amet odio fringilla molestie a nec purus. Morbi tristique iaculis pulvinar.")

  end
end
