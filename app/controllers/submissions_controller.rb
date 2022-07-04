class SubmissionsController < ApplicationController

  def mine    
    
  end

  def show
    # someone else's submissions
    
  end

  def update
    submission = Submission.find_by(id: params["id"])
    content = params["content"].blank? ? submission.content : params["content"]
    submission.content = content
    submission.is_public = !params["is_public"].nil?
    submission.save
    redirect_to "/submissions/#{submission.meeting.permalink}", notice: "Success!"
  end

  def destroy
    submission = Submission.find_by(id: params["id"])
    meeting = submission.meeting
    submission.delete
    redirect_to "/submissions/#{meeting.permalink}", notice: "Success!"
  end

  def create
    is_public = !params["is_public"].nil?
    Submission.create :content => params["content"],
                      :meeting_id => params["meeting_id"],
                      :user_id => params["user_id"],
                      :is_public => is_public
    meeting_permalink = Meeting.find_by_id(params["meeting_id"]).permalink

    redirect_to "/submissions/#{meeting_permalink}", notice: "Success!"
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
end
