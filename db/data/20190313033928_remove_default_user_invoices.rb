class RemoveDefaultUserInvoices < SeedMigration::Migration
  def up
    customer = Customer.find_by(:email => 'jdsilveira@gmail.com')
    customer.invoices.delete_all
  end

  def down

  end
end
