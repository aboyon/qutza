module Admin
  class CustomerAccessesController < Admin::ApplicationController
    def scoped_resource
      if params[:customer_id].present?
        resource_class.latest.for_customer(params[:customer_id])
      else
        resource_class.latest
      end
    end
  end
end
