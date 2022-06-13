class CommentsController < ApplicationController

  def create
    Comment.create :content => params["content"],
                   :submission_id => params["submission_id"],
                   :user_id => params["user_id"]


    redirect_to "/submissions/#{Submission.find_by_id(params["submission_id"]).meeting.title}"
  end

  def destroy
    comment = Comment.find_by(id: params["id"])
    meeting = comment.submission.meeting
    comment.delete
    redirect_to "/submissions/#{meeting.title}", notice: "Success!"
  end

  def update
  end
end