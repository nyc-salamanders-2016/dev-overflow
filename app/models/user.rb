class User < ActiveRecord::Base
  has_many :questions
  has_many :answers
  has_many :comments
  has_many :votes

  validates :first_name, :last_name, presence: true
  validates :username, :email, presence: true, uniqueness: true

  has_secure_password
end
