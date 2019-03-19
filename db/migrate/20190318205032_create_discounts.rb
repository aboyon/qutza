class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :discount_type, :null => false, :default => Discount::TYPE[:amount]
      t.float :value, :null => false
      t.string :name
      t.string :code

      t.timestamps
    end

    add_index :discounts, :name
    add_index :discounts, :code, :unique => true
  end
end
