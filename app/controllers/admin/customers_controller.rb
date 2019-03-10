module Admin
  class CustomersController < Admin::ApplicationController
    def index
      super
      @resources = Customer.page(params[:page]).per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Customer.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def activities
      @resource = find_resource(params[:id])
      @activities = Activity.all
    end

    def update_activities
      @resource = find_resource(params[:id])
      Rails.logger.info activity_parameters.values.flatten.map(&:to_i).inspect
      @resource.activity_ids = activity_parameters.values.flatten.map(&:to_i)
      redirect_to(admin_customer_path(@resource))
    end

    private

      def activity_parameters
        params.require(:user).permit(:activity => [])
      end
  end
end
