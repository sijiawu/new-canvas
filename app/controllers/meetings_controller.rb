class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all.order('created_at')
  end

  def update
    author = Author.find_by(id: params["id"])
    author.name = params["name"]
    author.save
    redirect_to "/meetings"
  end

  def destroy
    author = Author.find_by(id: params["id"])
    author.delete
    redirect_to "/meetings"
  end

  def create
    Author.create :name => params["name"]
    redirect_to "/meetings"
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