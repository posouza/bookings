module SessionsHelper
  def sign_in
    session[:user_id] = @user.id
  end

  #This method return information on a logged user in the system, including controllers, views and models.
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #This method will not allow a looged user to login again.
  def block_access
    if current_user.present?
      redirect_to users_path
    end
  end

  #This method allows to check a login status, if the a user is logged the current_user is not nill.
  def logged_in?
    !current_user.nil?
  end
end
