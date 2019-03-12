class Customer < ApplicationRecord
  belongs_to :user, :optional => true
  has_many :customer_activities
  has_many :activities, :through => :customer_activities
  has_many :customer_accesses
  has_many :accesses, :through => :customer_accesses
  has_many :invoices, -> { order('created_at DESC') }

  scope :active, -> { where(:active => true) }

  validates_presence_of :email
  validates_uniqueness_of :email

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
