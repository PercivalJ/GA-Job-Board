class UsersController < ApplicationController
    include SessionsHelper

def index
    if current_user
      @users = User.all
  else
      redirect_to login_path
    end
  end


  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    if current_user
    @user = current_user
  else
    redirect_to login_path
  end
end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit( :email, :password, :password_confirmation)
  end

  

end
