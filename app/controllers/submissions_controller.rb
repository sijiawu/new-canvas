class SubmissionsController < ApplicationController

  def mine    
    
  end

  def show
    # someone else's submissions
    
  end

  def update
    submission = Submission.find_by(id: params["id"])
    submission.content = params["content"]
    submission.save
    redirect_to "/submissions/#{submission.meeting.title}", notice: "Success!"
  end

  def destroy
    submission = Submission.find_by(id: params["id"])
    meeting = submission.meeting
    submission.delete
    redirect_to "/submissions/#{meeting.title}", notice: "Success!"
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
end
