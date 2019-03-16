class Invoice < ApplicationRecord
  include Concerns::CustomerCommon

  before_create :ensure_uid
  before_create :ensure_status
  before_create :ensure_due_date

  STATUS = {
    :paid => 'paid',
    :pending => 'pending'
  }.freeze

  scope :in_period, ->(date) {
    start_date = date.at_beginning_of_month
    end_date = date.at_end_of_month
    where('due_date >= ? AND due_date <= ?', start_date, end_date)
  }

  def paid?
    status.downcase == STATUS[:paid]
  end

  def due?
    due_date < Date.today
  end

  # @returns <String>
  # @desc "2019Aug"
  def period
    due_date.strftime("%Y/%m")
  end

  # @returns <Date>
  # @desc: First business day after day 10th of each month.
  def self.next_due_date(date)
    next_due_date = date.next_month.at_beginning_of_month + 9.days
    (next_due_date.sunday?) ? next_due_date.next_weekday : next_due_date
  end

  private

    def ensure_status
      self.status = STATUS[:pending]
    end

    def ensure_uid
      self.invoice_uid = SecureRandom.uuid.gsub('-','').first(10).upcase
    end

    def ensure_due_date
      self.due_date ||= self.class.next_due_date(Date.today)
    end
end
