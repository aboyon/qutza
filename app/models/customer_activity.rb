class CustomerActivity < ApplicationRecord
  include Concerns::CustomerCommon
  belongs_to :activity

  before_save :sanitize_price

  private

    def sanitize_price
      self.amount ||= activity.price.to_f
    end
end
