class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre


  validates :name, presence: true
  validates :detail, presence: true
  validates :unit_price, presence: true
end
