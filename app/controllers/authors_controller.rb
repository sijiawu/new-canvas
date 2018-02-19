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

end