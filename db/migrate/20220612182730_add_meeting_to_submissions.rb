class AddMeetingToSubmissions < ActiveRecord::Migration[6.1]
  def change
    add_reference :submissions, :meeting
  end
end
