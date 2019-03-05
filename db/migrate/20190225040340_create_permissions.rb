class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
    add_index :permissions, :code, :unique => true
  end
end
