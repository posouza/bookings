class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: "User was successfully created!"
        #tire o método de comentário quando criar o helper.
        #User can automatically access the system after registration.
    #sign_in(@user)
    else
      render action: :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

