require 'rails_helper'

describe User, type: :model do
  context "Admin" do
    subject { create(:user, :admin) }
    it { is_expected.to be_admin }
  end
end
