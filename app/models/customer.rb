class Customer < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :customer_activities
  has_many :activities, :through => :customer_activities
  has_many :customer_accesses, counter_cache: true
  has_many :invoices, -> { order('created_at DESC') }

  scope :active, -> { where(:active => true) }

  validates :email, :presence => true, :format => { with: URI::MailTo::EMAIL_REGEXP }

  def overdue?
    invoices
      .where(:status => Invoice::STATUS[:pending])
      .where('due_date < ?', Date.today)
      .any?
  end

  def deactivate!
    update_columns('status', false)
  end

  def activate!
    update_columns('status', true)
  end

end
