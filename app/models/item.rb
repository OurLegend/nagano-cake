class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  
  def add_tax_unit_price
  (self.unit_price * 1.10).round
  end

  validates :image, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :unit_price, presence: true
end
