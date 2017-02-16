class Auth::SessionsController < Auth::BaseController

  def create
    @user = User.find_by_email(params[:email])
    if @user && user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, success: "You're logged in."
    else
      redirect_to login_path, danger: "Invalid email or password"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
