class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details


  def with_tax_price
    (unit_price * 1.1).floor
  end

  validates :image, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :unit_price, presence: true
end
