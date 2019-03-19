class InvoiceDiscount < ApplicationRecord
  belongs_to :invoice
  belongs_to :discount

  before_save :apply_discount_amount, :unless => :paid?

  scope :unpaid, -> { where(:paid_at => nil) }

  def paid?
    paid_at.present?
  end

  private

    def apply_discount_amount
      self.amount = (discount.amount?) ? discount.value : (invoice.amount_paid.to_f * (discount.value.to_f / 100.0))
    end
end
