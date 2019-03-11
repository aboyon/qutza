class CustomerAccess < ApplicationRecord
  include Concerns::CustomerCommon

  before_create :ensure_timestamp

  scope :current_month, ->() {
    start_date = Date.today.at_beginning_of_month
    end_date = Date.today.at_end_of_month
    where('timestamp >= ? AND timestamp <= ?', start_date, end_date)
  }

  scope :latest, ->() { order('created_at DESC')}
  scope :for_customer, ->(customer_id) { where(:customer_id => customer_id) }

  private

    def ensure_timestamp
      self.timestamp ||= DateTime.now
    end
end
