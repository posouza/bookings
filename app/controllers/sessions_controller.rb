class SessionsController < ApplicationController
#This method is to prevent the user from logging in again once it's already logged.
before_action :block_access, except: [:destroy]

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
        sign_in(@user)
        redirect_to @user
    else
        render 'new'
    end
  end
end
