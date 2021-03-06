class UsersController < ApplicationController
  
  before_filter :authorize, only: [:show]

  def new
    @user = User.new

  end

  def create 
      @user = User.new(user_params) 
      if @user.save 
       session[:user_id] = @user.id 
       redirect_to user_path(@user)
      else 
       flash[:error] = @user.errors.full_messages.join(", ")
       redirect_to '/signup' 
      end 
  end

  def profile
      @user = User.find(session[:user_id])  
  end

  def edit 
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  
  def update
    user = User.find(params[:id])
    if user == current_user 
      user.update_attributes(user_params)
      redirect_to user_path(user)
    else
      session[:user_id]=nil
      redirect_to login_path
    end
  end    

private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :city, :avatar)
    end
end  