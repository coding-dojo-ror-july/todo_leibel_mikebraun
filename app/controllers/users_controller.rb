class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create, :authenticate]
  def index
  end

  def new
  end
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to "/tasks"
    else
      flash[:errors] = user.errors.full_messages
    end
  end

  def authenticate
    user = User.find_by(username: login_params[:username])
    if user.nil?
      flash[:errors] = ['User not found']
      redirect_to '/users/login'
    elsif user.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to "/tasks"
    else
      flash[:errors] = ['Incorrect Password']
      redirect_to '/users/login'
    end
  end

  def logout
    reset_session
    redirect_to '/users/login'
  end



  private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
  def login_params
    params.require(:user).permit(:username, :password)
  end
end
