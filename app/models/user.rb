class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable,
        :rememberable, :validatable
  has_one :customer
  has_many :user_roles
  has_many :roles, :through => :user_roles
  has_many :permissions, :through => :roles, :source => :role_permissions

  def admin?
    roles.pluck(:code).any? { |code| code.downcase == 'admin' }
  end
end
