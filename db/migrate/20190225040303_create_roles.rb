class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.string :code

      t.timestamps
    end

    add_index :roles, :code, :unique => true
  end
end
