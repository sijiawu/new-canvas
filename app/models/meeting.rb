class Meeting < ApplicationRecord
  has_many :submissions
  validates :title, presence: true
end
