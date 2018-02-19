class BooksController < ApplicationController

  def index
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
end
