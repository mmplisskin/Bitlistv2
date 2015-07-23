class UsersController < ApplicationController
  protect_from_forgery with: :null_session


  def new
    @user = User.new(user_params)
  end

  def create
    @user = User.create(user_params)
  end


  def index
    @users = User.find(current_user)

      respond_to do |format|
      format.html {
          render
      }
      format.json {
          render json: @users
      }
      end
  end


  def show
    @user = User.find(params[:id])
    items = @user.items.all
    @items = items.page(params[:page]).per(10)
    respond_to do |format|
    format.html {
        render
    }
    format.json {
        render json: @user
        # redirect_to(:controller => 'posts', :action => 'index')
    }
    end
  end

  def update
    @user = User.find(params[:id])

  if @user.update_attributes(user_params)

      respond_to do |format|
        format.html {
          render

        }

      format.json {
          render json: @user
      }
      end


    end
  end


private
  def user_params
    params.require(:user).permit()
  end
end
