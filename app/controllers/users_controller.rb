class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update] 

  def index 
  end 
  def new
    @user = User.new
  end 
  def create
    @user = User.new(user_params) 
    if @user.save 
      log_in @user
      redirect_to @user
    else
      render :new , status: :unprocessable_entity
    end 
  end

  def show 
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id]) 
  end 

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash.now[:success] = "User updated successfully" 
      redirect_to @user
    else 
      flash.now[:error] = "Update failed, check credentials"
      render :edit, status: :unprocessable_entity
    end
  end

  def logged_in_user
    if !logged_in? 
      flash[:danger] = "Please log in" 
      redirect_to new_session_url
    end
  end
  
  private 
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
    
end
