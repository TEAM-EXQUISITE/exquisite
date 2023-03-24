class SessionsController < ApplicationController
  def new
  end

  def create 
    user = User.find_by(email: params[:session][:email]) 
    if user &.authenticate(params[:session][:password]) 
      flash.now[:success] = "you have been verified" 
      log_in user 
      redirect_to user
    else 
      flash.now[:danger] = "wrong password/email combination" 
      render :new, status: :unprocessable_entity
    end 
  end 

  def destroy 
    log_out 
    redirect_to root_path
  end 
end
