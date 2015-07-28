class UserMailer < ApplicationMailer

  # before_action :generate_token

  def welcome(user_id)
    @user = User.find(user_id)
    @email = @user.email
    @name = @user.name
    @title = "Great to have you #{@user.name}"
    @subject = "Welcome! #{@user.name}"
    @greeting = "Thank you for joining the Bitlist community"
    @info = "Please be sure to follow our terms of service."
    @token = @user.access_token

    mail to: @email, subject: @subject

  end

  def check_in(user_id)
    @user = User.find(user_id)
    @email = @user.email
    @name = @user.name
    @title = "We haven't seen you in a while #{@user.name}"
    @subject = "Come back to Bitlist #{@user.name}"
    @greeting = "We miss you at Bitlist"
    @info = "Remember you can list items for Bitcoin!"
    @token = @user.access_token

    mail to: @email, subject: @subject

  end



  def item_listed(item_id)
    @item = Item.find(item_id)
    @category = Category.find(@item.category_id)
    @user = User.find(@item.user_id)
    @email = @user.email
    @name = @user.name
    @title = "You Listed a new Item!"
    @subject = "You Listed a new item in #{@category.name}"
    @greeting = "Hope it Sells!"
    @info = "Remember you can always list or delete items at Bitlist"
    @token = @user.access_token

    mail to: @email, subject: @subject
  end


  def item_deleted
    @greeting = "Hi"
    mail to: "to@example.org"
  end


  # def generate_token user_id
  #   @user = User.find(user_id)
  #   token = @user.access_token
  #   to
  # end


end
