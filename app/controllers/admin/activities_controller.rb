module Admin
  class ActivitiesController < Admin::ApplicationController
    before_action :resource, :except => [:index, :new, :create]

    def show
      @actual_income_in_current_period = resource.actual_income_in_period(Date.today)
      @estimated_monthly_income = resource.estimated_monthly_income
      @access_in_current_period = resource.access_in_period(Date.today)
      @access_in_last_period = resource.access_in_period(Date.today.last_month)
      super
    end

    private

      def resource
        @resource ||= find_resource(params[:id])
      end
  end
end
