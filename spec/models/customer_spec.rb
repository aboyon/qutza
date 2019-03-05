require 'rails_helper'

describe Customer, type: :model do
  context "Invocing" do
    context "Has debts" do
      let(:base_date) { Date.new(2019, 2, 5) }
      let(:customer) { create(:customer, :crossfiter_x2) }
      before(:each) do
        customer
        InvocingService.new(base_date).generate_invoices
      end
      it { expect(customer.no_debts?).to be_falsey }
      it { expect(customer.overdue?).to be_truthy }
    end
  end
end
