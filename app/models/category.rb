class Category < ApplicationRecord
  belongs_to :user
  has_many :category_entities
  has_many :entities, through: :category_entities

  include ImageUploader::Attachment(:image)

  validates :name, :image, presence: true


  def total_amount_for_user(user)
    category_entities.joins(:entity).where(entities: { author_id: user.id }).sum(:amount)
  end
end