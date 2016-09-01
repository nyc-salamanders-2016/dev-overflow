class Answer < ActiveRecord::Base
  belongs_to :author, class_name: "User", foreign_key: :user_id
  belongs_to :question

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
