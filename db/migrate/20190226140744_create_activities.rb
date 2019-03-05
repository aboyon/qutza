class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.float :price

      t.timestamps
    end
    add_index :activities, :name
  end
end
