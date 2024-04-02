class Post < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true
  validates :genre_id, presence: true
  validates :author, presence: true
  validates :text, presence: true
end
