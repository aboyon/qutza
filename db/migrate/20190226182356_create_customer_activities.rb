class CreateCustomerActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_activities do |t|
      t.integer :customer_id
      t.integer :activity_id
      t.float :amount

      t.timestamps
    end
  end
end
