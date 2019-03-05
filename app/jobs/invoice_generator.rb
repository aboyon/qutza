class InvoiceGenerator < ApplicationJob
  def perform
    Rails.logger.info "Starting Invoice generator"
    Rails.logger.info "Period: #{Date.today.strftime('%Y/%m').inspect}"
    InvocingService.new(Date.today).generate_invoices
  rescue => e
    Rails.logger.error "Error detected: #{e.inspect}"
    retry
  end
end
