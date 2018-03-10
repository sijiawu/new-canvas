class SessionsController < ApplicationController

  def create

    @user = User.find_by(email: params["email"])
    if @user != nil
      if @user.authenticate(params["password"])
        cookies[:user_id] = @user.id
        redirect_to "/", notice: "Welcome!"
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
    redirect_to "/books", notice: "Successfully logged out!"
  end
end