class AddStatusToActivity < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :active, :boolean, :default => true
  end
end
