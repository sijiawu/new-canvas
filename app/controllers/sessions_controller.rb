class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params["email"])
    if user != nil
      if user.password == params["password"]
        cookies[:user_id] = user.id
        #cookies.signed[:user_id] = user.id
        #cookies.encrypted[:user_id] = user.id

        redirect_to "/"
      else

        redirect_to "/sessions/new"
      end
    else
      redirect_to "/sessions/new"
    end
  end

  def delete
    cookies.delete(:user_id)
    # cookies
    redirect_to "/books"
  end
end