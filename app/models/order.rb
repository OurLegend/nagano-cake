class Order < ApplicationRecord
  enum payment_method: {credit_card:0, transfer:1}
  enum status: {awaiting_payment:0, payment_confirmation:1, in_making:2, preparing_to_ship:3, shipped:4}
  belongs_to :customer
  has_many :order_details

  validates :shipping_postcode, presence: true
  validates :shipping_address, presence: true
  validates :shipping_name, presence: true
end
