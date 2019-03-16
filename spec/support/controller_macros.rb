module ControllerMacros
  def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    sign_in(create(:user, :admin))
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = create(:user)
      user.confirm!
      sign_in(user)
    end
  end
end

RSpec.configure do |config|
  config.include ControllerMacros, :type => :controller
end
