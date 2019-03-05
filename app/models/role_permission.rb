class RolePermission < ApplicationRecord
  belongs_to :role
  belongs_to :permission

  validates_uniqueness_of :permission, :scope => :role
end
