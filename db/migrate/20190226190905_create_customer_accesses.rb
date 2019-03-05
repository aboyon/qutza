class CreateCustomerAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_accesses do |t|
      t.integer :customer_id
      t.datetime :timestamp

      t.timestamps
    end
  end
end
