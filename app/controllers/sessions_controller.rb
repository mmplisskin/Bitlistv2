class SessionsController < ApplicationController
  def new
	end

    def create
	    @user = User.from_omniauth(request.env['omniauth.auth'])
	    session[:user_id] = @user.id

 		if @user.save
			# if @ouser.created_at > 1.minute.ago
			#  	UserMailer.delay.welcome_email(@ouser.id)
			# # UserMailer.welcome_email(@ouser.id).deliver
      #
      #
      #
			# end
		end
      redirect_to categories_path
	end

	def destroy
		session.delete(:user_id)
		redirect_to login_path
	end
end
