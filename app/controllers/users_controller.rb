class UsersController < ApplicationController

  def update
    user = User.find_by(id: params["id"])
    user.username = params["username"]
    user.email = params["email"]
    user.password = params["password"]
    user.save
    redirect_to "/users"
  end

  def index
    if User.find_by(id: cookies[:user_id]) != nil
      if User.find_by(id: cookies[:user_id]).username == "admin"
        render 'index'
      else 
        redirect_to "/", notice: "You do not have permission to access"
      end
    else 
      redirect_to "/", notice: "You do not have permission to access"  
    end
  end

  def show
    if User.find_by(id: cookies[:user_id]) != nil
      if User.find_by(id: cookies[:user_id]).username == "admin"
        render 'show'
      else 
        redirect_to "/", notice: "You do not have permission to access"
      end
    else 
      redirect_to "/", notice: "You do not have permission to access"  
    end
  end

  def edit
    if User.find_by(id: cookies[:user_id]) != nil
      if User.find_by(id: cookies[:user_id]).username == "admin"
        render 'edit'
      else 
        redirect_to "/", notice: "You do not have permission to access"
      end
    else 
      redirect_to "/", notice: "You do not have permission to access"  
    end
  end

  def destroy
    user = User.find_by(id: params["id"])
    user.delete
    redirect_to "/users"
  end

  def create
    User.create :username => params["username"], :email => params["email"], :password => params["password"]
    redirect_to "/", notice: "New account created!"
  end

end