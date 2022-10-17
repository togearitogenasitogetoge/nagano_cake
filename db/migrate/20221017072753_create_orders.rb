class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, :null => false
      t.integer :payment_method, :null => false
      t.integer :order_status, :null => false
      t.integer :shipping_fee, :null => false
      t.integer :request_amount, :null => false
      t.string :name, :null => false
      t.string :postal_code, :null => false
      t.text :address, :null => false

      t.timestamps
    end
  end
end
