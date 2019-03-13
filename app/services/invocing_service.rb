class InvocingService

  def initialize(date = nil)
    @date = date || Date.today
  end

  def generate_invoices
    Customer.active.each do |customer|
      activities = customer.activities.pluck(:name, :price)
      next if activities.empty?
      invoice_description = activities.collect(&:first).join(', ')
      invoice_amount = activities.sum(&:last)
      Invoice.create!({
        :due_date => Invoice.next_due_date(@date),
        :customer => customer,
        :description => invoice_description,
        :amount => invoice_amount
      })
    rescue ActiveRecord::RecordInvalid => e
      Rails.logger.error "Error creando factura para #{customer.name}"
      Rails.logger.error "Error #{e.inspect}"
    end
  end

end
