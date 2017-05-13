class Post < ApplicationRecord
  belongs_to :user

  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :user, presence: true
end
