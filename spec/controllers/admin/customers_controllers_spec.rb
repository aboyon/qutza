require 'rails_helper'

describe Admin::CustomersController, :type => :controller do
  before { login_admin }

  describe "#index" do
    before { get :index }
    it { expect(response).to have_http_status(:success) }
  end

  describe "#activities" do
    let(:customer) { create(:customer, :crossfiter_x2) }
    before { get :activities, :params => {:id => customer.id} }
    it { expect(response).to have_http_status(:success) }
  end

  describe "#update_activities" do
    let(:customer) { create(:customer, :crossfiter_x2) }
    let(:activity) { create(:activity, :psi) }

    let(:user_params) do
      {
        :activity => activities
      }
    end

    before do
      put :update_activities, :params => {:id => customer.id, :user => user_params }
    end

    context "Success" do
      let(:activities) { [activity.id] }
      it "customer changes activity" do
        customer.reload
        expect(customer.activities).to include(activity)
      end
    end

    context "Fails" do
      let(:activities) { [] }
      it "customer doesn't change activities" do
        customer.reload
        expect(customer.activities).not_to include(activity)
      end
    end
  end

  describe "#create_payment" do
    let(:customer) { create(:customer, :crossfiter_x2) }
    before do
      post :create_payment, :params => {:id => customer.id, :user_invoice => user_invoice }
      customer.invoices.reload
    end

    let(:user_invoice) do
      {
        :due_date => Date.new(2019, 3, 31),
        :amount => 500,
        :description => "test",
        :amount_paid => 450
      }
    end

    context "Success" do
      it { expect(customer.invoices).not_to be_empty }
    end
  end

end
