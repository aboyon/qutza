module Concerns
  module Admin
    module Common
      extend ActiveSupport::Concern

      included do
        before_action :resource, :except => [:index, :new, :create]
      end

      protected

        def resource
          @resource ||= find_resource(params[:id])
        end
    end
  end
end
