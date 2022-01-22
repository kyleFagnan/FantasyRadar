class UsersController < ApplicationController
  
  def show
    @user=User.find(session[:user_id])
  end  
  
  def new
  end

  def create
    # byebug
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      # byebug
      redirect_to "/"
    else
      redirect_to '/signup'
    end
  end
  
  def edit
    @user = User.find(params[:id]) 
  end


  def update
    @user = User.find(session[:user_id])
  
    if @user.update(user_params)
      render 'show'
    else
      render 'edit'
    end
  end

private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :phone_number,
      :email,
      :password,
      :password_confirmation
    )
  end
end