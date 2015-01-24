include Rails.application.routes.url_helpers

begin
  namespace :admin do
    task :create => :environment do
      puts "You will be prompted to enter an email address and password for the new user"
      puts "Enter an email address:"
      email = STDIN.gets
      puts "Enter a password:"
      password = STDIN.gets
      unless email.strip!.blank? || password.strip!.blank?
        if User.create!(:email => email, :password => password)
          puts "The user was created successfully."
        else
          puts "Sorry, the user was not created!"
        end
      end
    end
  end
end
