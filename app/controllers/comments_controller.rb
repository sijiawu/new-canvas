class CommentsController < ApplicationController

  def create
    Comment.create :content => params["content"],
                   :submission_id => params["submission_id"],
                   :user_id => params["user_id"]


    redirect_to "/submissions/#{Submission.find_by_id(params["submission_id"]).meeting.title}"
  end
end