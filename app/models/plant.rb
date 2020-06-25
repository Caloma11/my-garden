class Plant < ApplicationRecord
  belongs_to :garden
  validates :name, :image_url, presence: true
  has_many :plant_tags
  has_many :tags, through: :plant_tags
end
