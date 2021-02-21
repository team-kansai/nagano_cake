class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.integer :payment_method
      t.integer :total_price
      t.string :postcode
      t.string :address
      t.string :name
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
