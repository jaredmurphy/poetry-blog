class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  belongs_to :user

  validates :body, length: { minimum: 1 }
  validates :user, presence: true
  validates :commentable, presence: true
end
