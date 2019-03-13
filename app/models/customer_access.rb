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

  validates_uniqueness_of :customer_id, conditions: ->() {
    where('timestamp >= ?', (DateTime.now - 4.hours))
  }, :on => :create, :message => :eager_customer_trying_to_access

  private

    def ensure_timestamp
      self.timestamp ||= DateTime.now
    end
end
