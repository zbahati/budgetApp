class Category < ApplicationRecord
  belongs_to :user
  has_many :category_entities

  validates :name, :icon, presence: true
end