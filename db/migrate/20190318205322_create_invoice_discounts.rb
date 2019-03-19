class CreateInvoiceDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :invoice_discounts do |t|
      t.belongs_to :invoice
      t.belongs_to :discount
      t.float :amount, :null => false
      t.string :notes
      t.datetime :paid_at

      t.timestamps
    end

    add_index :invoice_discounts, [:invoice_id, :discount_id], :unique => true
  end
end
