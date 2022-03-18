class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
        t.string :product_code, null: false
        t.float :unit_price, default: 0.0
        t.float :bundle_price, default: 0.0
        t.integer :bundle_size, default: 0
      t.timestamps
    end
  end
end
