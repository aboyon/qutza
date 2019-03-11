class Users::RegistrationsController < Devise::RegistrationsController
  layout 'application'

  protected

    def after_update_path_for(resource)
      admin_path
    end
end
