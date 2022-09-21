class Destination < ApplicationRecord
    belongs_to :customer

    validates :shipping_postcode, presence: true
    validates :shipping_address, presence: true
    validates :direction, presence: true
end
