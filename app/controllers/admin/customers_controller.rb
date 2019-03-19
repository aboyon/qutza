module Admin
  class CustomersController < Admin::ApplicationController
    include Concerns::Admin::Common

    def scoped_resource
      resource_class.order('name ASC')
    end

    def activities
      @activities = Activity.active.all
    end

    def update_activities
      resource.activity_ids = activity_parameters.values.flatten.map(&:to_i)
      redirect_to(admin_customer_path(resource))
    rescue ActionController::ParameterMissing => e
      flash[:error] = "Por favor selecciona al menos una actividad"
      redirect_to(activities_admin_customer_path(resource))
    end

    def new_payment
      activities_data = resource.activities.pluck(:price, :name)
      @invoce_data = {
        :total_amount => activities_data.sum(&:first).to_f,
        :description => activities_data.map(&:last).join(',')
      }
    end

    def create_payment
      begin
        invoice = Invoice.create!(create_invoice_params.merge!(:customer => resource))
        redirect_to(edit_admin_invoice_path(invoice))
      rescue => e
        flash[:error] = e.message
        redirect_to(payment_admin_customer_path(resource))
      end
    end

    private

      def activity_parameters
        params.require(:user).permit(:activity => [])
      end

      def create_invoice_params
        params.require(:user_invoice).permit(:due_date, :amount, :description, :amount_paid)
      end
  end
end
