class UsersController < ApplicationController
  before_action :find_user, only:[:show, :edit, :update, :destroy,]

  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.create(user_params)
  end


  def index
    @users = User.find(current_user)
  end


  def show
    @user = User.find(params[:id])
    items = @user.items.all
    @items = items.page(params[:page]).per(10)
  end

  def admin
    if current_user && current_user.admin
      users = User.all
      @users = users.page(params[:page]).per(4)
    else
      redirect_to root_path
    end
  end

  def destroy
        @user.destroy
        flash[:notice] = "User was removed!"
        redirect_to admin_path
    end

    def unsubscribe
      if user = User.read_access_token(params[:signature])
        user.update_attribute :email_opt_in, false
        render text: "You have been unsubscribed"
      else
        render text: "Invalid Link"
      end
    end

  # def update
  #   @user = User.find(params[:id])
  #
  # if @user.update_attributes(user_params)
  #
  #     respond_to do |format|
  #       format.html {
  #         render
  #
  #       }
  #
  #     format.json {
  #         render json: @user
  #     }
  #     end
  #
  #
  #   end
  # end


private
  def user_params
    params.require(:user).permit(:email_opt_in)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
