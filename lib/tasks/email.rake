namespace :send do
  desc "sends email to users"
  task :email => :environment do
    puts "######### preparing to send update emails ################"

     users = Users.where(email_opt_in: true)
     puts users

  end
    puts "emails have been sent"
end
