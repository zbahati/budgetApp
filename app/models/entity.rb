class Entity < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :category_entities

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
