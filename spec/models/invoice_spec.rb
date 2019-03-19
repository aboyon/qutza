require 'rails_helper'

describe Invoice, type: :model do
  subject { build(:invoice) }

  describe "#next_due_date" do
    context "Invoice created on March 4th due on April 10th" do
      let(:date) { Date.new(2019, 3, 4) }
      let(:due_date) { Date.new(2019, 4, 10) }

      it { expect(subject.class.next_due_date(date)).to eq(due_date) }
      it { expect(subject.class.next_due_date(date)).not_to be_sunday }
    end
  end

  describe "#due?" do
    before do
      subject.due_date = Date.yesterday
    end

    it { expect(subject).to be_due }
  end

  describe "#paid?" do
    before do
      subject.status = Invoice::STATUS[:paid]
    end

    it { expect(subject).to be_paid }
  end

  describe "#period" do
    before do
      subject.due_date = Date.new(2019, 3, 10)
    end

    it { expect(subject.period).to eq('2019/03') }
  end

  describe "#profit" do
    before do
      subject.customer = create(:customer, :crossfiter_x2)
      subject.amount_paid = 500.0
      subject.save
      subject.discounts << discount
    end

    context "discount is percentage" do
      let(:discount) { create(:discount, :percentage) }
      it { expect(subject.profit).to eq(250.0) }
    end

    context "discount is fixed amount" do
      let(:discount) { create(:discount, :amount) }
      it { expect(subject.profit).to eq(490.0) }
    end
  end
end
