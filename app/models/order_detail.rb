class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  enum production_status: {cannot_start:0, awaiting_manufacture:1, maiking:2, completion_of_production:3}
end
