class Article < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :user

  paginates_per 6

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def self.search(query)
    if query
      return Article.all.where(["title Like ?", "%#{query}%"])
    else
      return Article.all
    end
  end
end
