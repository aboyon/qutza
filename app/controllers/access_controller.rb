class AccessController < ApplicationController
  before_action :set_default_response_format, :only => [:create]
  before_action :find_customer, :only => [:create]

  def index; end

  def create
    access = CustomerAccess.create!(:customer => @customer)
    render :json => {
      :customer => @customer.name,
      :access => access.attributes
    }.to_json, :status => :ok
  rescue ActiveRecord::RecordNotFound => e
    fail_nicely(e, @customer, :not_found) && return
  rescue ActiveRecord::RecordInvalid, ActiveRecord::StatementInvalid => e
    fail_nicely(e, access, :bad_format) && return
  rescue => e
    fail_nicely(e, access) && return
  end

  private

    def find_customer
      @customer = Customer.find_by!(:person_identifable_nbr => create_params[:person_id])
    end

    def create_params
      params.require(:access).permit(:person_id)
    end

    def set_default_response_format
      request.format = :json
    end

    def fail_nicely(e, resource, status = :internal_server_error)
      error = {:attributes => resource.errors.to_hash }
      error[:backtrace] = e.backtrace.reject {|path| path.include?('.rbenv') }.first(10) unless Rails.env.production?
      render :json => {:exception => e.inspect, :errors => error}.to_json, :status => status
    end

end