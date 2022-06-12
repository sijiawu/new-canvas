class Submission < ApplicationRecord
	belongs_to :meeting
	belongs_to :user
	has_many :comments
	validates :content, presence: true
end
