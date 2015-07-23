# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
  def welcome
    UserMailer.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/item_listed
  def item_listed
    UserMailer.item_listed
  end

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/item_deleted
  def item_deleted
    UserMailer.item_deleted
  end

end
