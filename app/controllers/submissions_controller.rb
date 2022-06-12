class BooksController < ApplicationController

  def index

    @submissions = Book.all.limit(100).order('created_at desc')
    
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
    Book.create :title => params["title"],
                :summary => params["summary"],
                :cover_url => params["cover_url"],
                :author_id => params["author_id"]
    redirect_to "/"
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
