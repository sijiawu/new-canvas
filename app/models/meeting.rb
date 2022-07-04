class Meeting < ApplicationRecord
  has_many :submissions
  validates :permalink, presence: true
  validates :title, presence: true
end
