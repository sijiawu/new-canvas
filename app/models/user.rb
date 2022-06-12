class User < ApplicationRecord

  has_secure_password
  has_many :submissions
  has_many :comments

  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true

end