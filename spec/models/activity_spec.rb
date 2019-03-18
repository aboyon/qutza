require 'rails_helper'

describe Activity, type: :model do
  subject { create(:activity, :crossfit_x2) }

  describe "#estimated_monthly_income" do
    context "Activity has not clients" do
      it { expect(subject.estimated_monthly_income).to eq(0.0) }
    end

    context "Activity has clients" do
      before do
        create_list(:customer, 3, :activity_ids => [subject.id])
      end

      it { expect(subject.estimated_monthly_income).to eq(2400.0) }
    end
  end

  describe "#access_in_period" do
    before do
      CustomerAccess.delete_all
      create_list(:customer, 3, :activity_ids => [subject.id])
      subject.customers.each do |customer|
        create(:customer_access, :customer => customer)
      end
    end

    it { expect(subject.access_in_period(Date.today)).to eq(3) }
  end

  describe "#actual_income_in_period" do
    before do
      Invoice.delete_all
      create_list(:customer, 3, :activity_ids => [subject.id])
      subject.customers.each do |customer|
        invoice = create(:invoice, {
          :customer => customer,
          :amount_paid => subject.price,
          :due_date => Date.today
        })
        invoice.update_column('status', 'paid')
      end
    end

    it { expect(subject.actual_income_in_period(Date.today)).to eq(2400.0) }
  end
end
