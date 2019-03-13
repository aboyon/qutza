class AddMedicalAuthorizationToCustomer < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :medical_approval, :boolean, :default => true
    add_column :customers, :notes, :text
  end
end
