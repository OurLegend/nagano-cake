class Destination < ApplicationRecord
    belongs_to :customer

    validates :shipping_postcode, presence: true
    validates :shipping_address, presence: true
    validates :direction, presence: true

    def destination_all
    '〒' + self.shipping_postcode+" "+self.shipping_address+" "+self.direction
    end
end
