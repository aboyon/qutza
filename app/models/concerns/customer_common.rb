module Concerns
  module CustomerCommon
    extend ActiveSupport::Concern

    included do
      belongs_to :customer
    end

    def client_name
      customer.name
    end
  end
end
