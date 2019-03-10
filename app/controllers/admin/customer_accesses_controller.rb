module Admin
  class CustomerAccessesController < Admin::ApplicationController
    def index
      super
      @resources = CustomerAccess.latest
      @resources = @resources.for_customer(params[:customer_id]) if params[:customer_id].present?
      @resources.page(params[:page]).per(20)
    end
  end
end
