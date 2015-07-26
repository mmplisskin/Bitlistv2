class UserMailer < ApplicationMailer

  before_action :generate_token

  def welcome(user_id, token)
    @user = User.find(user_id)
    @email = @user.email
    @name = @user.name
    @title = "Great to have you #{@user.name}"
    @subject = "Welcome! #{@user.name}"
    @greeting = "Thank you for joining the Bitlist community"
    @info = "Please be sure to follow our terms of service."
    @token = User.access_token


    mail to: @email, subject: @subject

  end


  def item_listed
    @greeting = "Hi"

    mail to: "to@example.org"
  end


  def item_deleted
    @greeting = "Hi"
    mail to: "to@example.org"
  end


  def generate_token(user_id)
    @user = User.find(user_id)
    token = @user.acces_token
  end


end
