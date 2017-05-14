class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable 

  validates :title, uniqueness: true, presence: true
  validates :description, presence: true
  validates :user, presence: true

  has_attached_file :image, 
    styles: { large: "1200x1200>", medium: "600x600>", small: "200x200>" }, 
    default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
