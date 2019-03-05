class InvocingService

  def initialize(date)
    @date = date
  end

  def generate_invoices
    Customer.active.each do |customer|
      activities = customer.activities.pluck(:name, :price)
      invoice_description = activities.collect(&:first).join(', ')
      invoice_amount = activities.sum(&:last)
      Invoice.create!(:customer => customer, :description => invoice_description, :amount => invoice_amount)
    end
  end

end
