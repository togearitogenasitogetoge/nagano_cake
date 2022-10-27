class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :genre_id, null: false
      t.string :product_name, null: false
      t.text :product_description, null: false
      t.integer :tax_excluded_price, null: false
      t.boolean :sales_status, null: false, default: true
      

      t.timestamps
    end
  end
end
