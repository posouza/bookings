class SessionsController < ApplicationController
#This method is to prevent the user from logging in again once it's already logged.
before_action :block_access, except: [:destroy]

  def create

    @user = User.find_by(email: params[:session][:email].downcase)
    #return render json: @user.authenticate(params[:session][:password])
    if @user && @user.authenticate(params[:session][:password])
      sign_in
      redirect_to current_user
    else
      render action: :new
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
