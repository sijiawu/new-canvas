class SubmissionsController < ApplicationController

  def mine    
    
  end

  def show
    # someone's submissions
    
  end

  def update
    book = Book.find_by(id: params["id"])
    book.title = params["title"]
    book.summary = params["summary"]
    book.cover_url = params["cover_url"]
    book.author_id = params["author_id"]
    book.save
    redirect_to "/"
  end

  def destroy
    book = Book.find_by(id: params["id"])
    book.delete
    redirect_to "/"
  end

  def create
    Submission.create :content => params["content"],
                      :meeting_id => params["meeting_id"],
                      :user_id => params["user_id"]
    meeting_title = Meeting.find_by_id(params["meeting_id"]).title

    redirect_to "/submissions/#{meeting_title}", notice: "Success!"
  end

  def new
    if User.find_by(id: cookies[:user_id]) != nil
      if User.find_by(id: cookies[:user_id]).username == "admin"
        render 'new'
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
end
