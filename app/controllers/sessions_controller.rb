class SessionsController < ApplicationController

  def create

    @user = User.find_by(email: params["email"])
    if @user != nil
      if @user.authenticate(params["password"])
        cookies[:user_id] = @user.id
        redirect_to "/", notice: "Welcome, #{@user.username}!"
      else
        redirect_to "/sessions/new", notice: "Password incorrect"
      end
    else
      redirect_to "/sessions/new", notice: "User does not exist"
    end
  end

  def delete
    cookies.delete(:user_id)
    # cookies
    redirect_to :root, notice: "You have logged out successfully!"
  end
end