module Admin
  class InvoicesController < Admin::ApplicationController
    include Concerns::Admin::Common

    def index
      @total_collected = scoped_resource.sum(:amount_paid).to_f
      @total_estimated = Activity.active.all.map(&:estimated_monthly_income).sum
      @balance = @total_collected - @total_estimated
      super
    end

    def scoped_resource
      query = resource_class.order('created_at DESC')
      period = (params[:period].present?) ? Date.parse("#{params[:period]}-01") : Date.today
      query = query.in_period(period)
      query = query.paid if params[:paid_only] == 'y'
      query
    end
  end
end
