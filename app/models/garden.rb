class Garden < ApplicationRecord
  has_many :plants
  validates :name, :banner_url, presence: true
end
