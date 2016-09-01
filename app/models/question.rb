class Question < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id

  has_many :answers
  has_many :questions_tags

  has_many :tags, through: :questions_tags

  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable

  def total_votes
    total = self.votes.reduce(0) { |sum, vote| sum + vote.value}

    if total < 0
      total = 0
    end
    total
  end
end
