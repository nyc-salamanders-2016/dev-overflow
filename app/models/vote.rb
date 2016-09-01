class Vote < ActiveRecord::Base
  belongs_to :user

  belongs_to :votable, :polymorphic => true

  validates :user, uniqueness: { scope: :votable }
end
