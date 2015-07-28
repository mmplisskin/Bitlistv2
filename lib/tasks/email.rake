namespace :send do
  desc "sends email to users"
  task :email => :environment do
    puts "######### preparing to send update emails ################"

     users = User.where(email_opt_in: true)

     users.each do | user |
       if (user.last_login > 30.days.ago )
            UserMailer.delay.check_in(user.id)
        end
     end



  end
    puts "emails have been sent"
end
