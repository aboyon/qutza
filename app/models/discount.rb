class Discount < ApplicationRecord
  has_many :invoice_discounts
  has_many :invoices, :through => :invoice_discounts

  before_save :ensure_code

  TYPE = {
    :percentage => 'percentage',
    :amount => 'amount',
  }.freeze

  def percentage?
    (TYPE[:percentage] == discount_type)
  end

  def amount?
    (TYPE[:amount] == discount_type)
  end

  def pending_to_collect
    invoice_discounts.unpaid.sum(:amount)
  end

  def total
    invoice_discounts.unpaid.sum(:amount)
  end

  private

    def ensure_code
      self.code ||= name.parameterize.underscore
    end
end
