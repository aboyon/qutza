class Activity < ApplicationRecord
  has_many :customer_activities, counter_cache: true
  has_many :customers, :through => :customer_activities

  scope :active, -> { where(:active => true) }

  def estimated_monthly_income
    return 0.0 if customers.empty?
    (customers.size.to_f * price).to_f
  end

  def access_in_period(date = Date.today)
    CustomerAccess.for_customer(customer_ids)
      .in_period(date)
      .count
  end

  def actual_income_in_period(date = Date.today)
    Invoice.paid.where(:customer_id => customer_ids)
      .in_period(date)
      .sum(:amount_paid)
  end
end
