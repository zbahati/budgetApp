class User < ApplicationRecord
  has_many :entities
  has_many :categories
  has_many :category_entities, through: :category
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :name, presence: true
end
