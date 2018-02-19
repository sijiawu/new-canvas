class UsersController < ApplicationController

  def update
    user = User.find_by(id: params["id"])
    user.username = params["username"]
    user.email = params["email"]
    user.password = params["password"]
    user.save
    redirect_to "/users"
  end

  def destroy
    user = User.find_by(id: params["id"])
    user.delete
    redirect_to "/users"
  end

  def create
    User.create :username => params["username"], :email => params["email"], :password => params["password"]
    redirect_to "/users"
  end

end