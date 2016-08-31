class Answer < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id
  belongs_to :question

  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
end
