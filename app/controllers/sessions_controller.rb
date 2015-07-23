class SessionsController < ApplicationController
  def new
	end

    def create
	    @user = User.from_omniauth(request.env['omniauth.auth'])
	    session[:user_id] = @user.id

 		if @user.save
			if @user.created_at > 1.minute.ago
			 	UserMailer.delay.welcome(@user.id)

			end
		end
      redirect_to user_path(@user.id)
	end

	def destroy
		session.delete(:user_id)
		redirect_to root_path
	end
end
