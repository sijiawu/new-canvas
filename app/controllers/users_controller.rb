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
        redirect_to "/", notice: "You do not have permission to access this page"
      end
    else 
      redirect_to "/", notice: "You do not have permission to access this page"  
    end
  end

  def show
    if User.find_by(id: cookies[:user_id]) != nil
      if User.find_by(id: cookies[:user_id]).username == "admin"
        render 'show'
      else 
        redirect_to "/", notice: "You do not have permission to access this page"
      end
    else 
      redirect_to "/", notice: "You do not have permission to access this page"  
    end
  end

  def edit
    if User.find_by(id: cookies[:user_id]) != nil
      if User.find_by(id: cookies[:user_id]).username == "admin"
        render 'edit'
      else 
        redirect_to "/", notice: "You do not have permission to access this page"
      end
    else 
      redirect_to "/", notice: "You do not have permission to access this page"  
    end
  end

  def destroy
    user = User.find_by(id: params["id"])
    user.delete
    redirect_to "/users"
  end

  def create
    if params["access_code"] == "cre@tive@lchemy"
      user = User.create :username => params["username"], :email => params["email"], :password => params["password"]
      cookies[:user_id] = user.id
      redirect_to "/", notice: "Welcome, #{user.username}!"
    else
      redirect_to "/", notice: "Incorrect access code!"
    end
  end
end