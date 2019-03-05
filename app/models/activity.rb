class Activity < ApplicationRecord
  has_many :customer_activities
  has_many :customers, :through => :customer_activities
end
