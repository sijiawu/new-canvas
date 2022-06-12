class ReviewsController < ApplicationController

  def create
    Review.create :content => params["content"],
                  :creator => User.find_by(id: cookies[:user_id]).username,
                  :book => Book.find_by(title: params[:book_id])


    redirect_to "/books/#{Book.find_by(title: params[:book_id]).id}"
  end
end