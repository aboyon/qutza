class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.integer :user_id, :null => true
      t.string :person_identifable_nbr
      t.string :email
      t.datetime :joined_at
      t.boolean :active, :default => true

      t.timestamps
    end
    add_index :customers, :name
    add_index :customers, :email, :unique => true
    add_index :customers, :person_identifable_nbr, :unique => true
    add_index :customers, :joined_at
  end
end
