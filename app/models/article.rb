class Article < ApplicationRecord
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
