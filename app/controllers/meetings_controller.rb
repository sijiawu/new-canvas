class MeetingsController < ApplicationController

  def index
    @meetings = Meeting.all.order('created_at')
  end

  def update
    meeting = Meeting.find_by(id: params["id"])
    meeting.permalink = params["permalink"]
    meeting.title = params["title"]
    meeting.additional_info = params["additional_info"]

    meeting.save
    redirect_to "/", notice: "Success!"
  end

  def destroy
    meeting = Meeting.find_by(id: params["id"])
    meeting.delete
    redirect_to "/", notice: "Success!"
  end

  def create
    Meeting.create :permalink => params["permalink"],
                   :title => params["title"],
                   :additional_info => params["additional_info"]
    redirect_to "/", notice: "Success!"
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