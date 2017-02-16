class Auth::UsersController < Auth::BaseController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #byebug
    if @user.save
      session[:user_id] = @user.id
      # User.mailer.register_email(@user).deliver_now
      redirect_to root_path, success: "You are now registered and logged in."
    else
      redirect_to '/register', danger: "Invalid email or password"
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
