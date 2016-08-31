class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id

  has_many :answers
  has_many :questions_tags

  has_many :tags, through: :questions_tags

  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
end
