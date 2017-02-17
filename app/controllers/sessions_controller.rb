class SessionsController < ApplicationController

def create
  @user = User.find_by_email(params[:email])
  # If the user exists AND the password entered is correct.
  if @user && @user.authenticate(params[:password])
    # Save the user id inside the browser cookie. This is how we keep the user
    # logged in when they navigate around our website.
    puts "authenticated"
    # puts current_user
    # puts current_user
    session[:user_id] = @user.id
#     byebug
#     $current_user = User.find(session[:user_id])
# puts $current_user
    redirect_to '/'
  else
    puts "authentication failed"
  # If user's login doesn't work, send them back to the login form.
    redirect_to '/login'
  end
end

def destroy
  session[:user_id] = nil
  redirect_to '/login'
end

end
