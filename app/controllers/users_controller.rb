class UsersController < ApplicationController
  
  def show
    @user=User.find(params[:id])
  end  
  
  def new
  end

  def edit
    @user = User.find(params[:id]) 
  end
  
  def create
  end

  def update
    @user = User.find(1)# User.find(session[:user_id])
   
    if @user.update(user_params)
      render 'show'
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :notification_type)
  end

end