module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authorize_user

    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, :content_type => 'text/json' }
        format.html { render 'admin/application/forbidden', :status => 403 }
        format.js   { head :forbidden, :content_type => 'text/json' }
      end
    end

    # rescue_from ActiveRecord::RecordNotFound do |exception|
    #   respond_to do |format|
    #     format.json { head :not_found, :content_type => 'text/json' }
    #     format.html { render 'admin/application/not_found', :status => 404 }
    #     format.js   { head :not_found, :content_type => 'text/json' }
    #   end
    # end

    def requested_resources
      scoped_resource
    end
    helper_method :requested_resources

    def requested_resource
      @requested_resource ||= find_resource(params[:id])
    end
    helper_method :requested_resource

    protected

      def authorize_user
        redirect_to(new_user_session_path) and return unless current_user
        raise CanCan::AccessDenied unless current_user&.admin?
      end
  end
end
