class AuthorsController < ApplicationController

  def update
    author = Author.find_by(id: params["id"])
    author.name = params["name"]
    author.save
    redirect_to "/authors"
  end

  def destroy
    author = Author.find_by(id: params["id"])
    author.delete
    redirect_to "/authors"
  end

  def create
    Author.create :name => params["name"]
    redirect_to "/authors"
  end

  def new
    if User.find_by(id: cookies[:user_id]) != nil
      if User.find_by(id: cookies[:user_id]).username == "admin"
        render 'new'
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

end