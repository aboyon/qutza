class CreateInvoices < ActiveRecord::Migration[5.2]
  def change
    create_table :invoices do |t|
      t.integer :customer_id
      t.string :status
      t.string :payment_receipt
      t.float :amount
      t.float :amount_paid
      t.string :invoice_uid
      t.string :description
      t.date :due_date

      t.timestamps
    end
  end
end
