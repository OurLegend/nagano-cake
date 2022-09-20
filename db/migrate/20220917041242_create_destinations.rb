class CreateDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :destinations do |t|

      t.integer :customer_id, null: false
      t.string :shipping_postcode, null: false
      t.string :shipping_address, null: false
      t.string :direction, null: false

      t.timestamps
    end
  end
end
