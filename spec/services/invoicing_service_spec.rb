require 'rails_helper'

describe InvocingService, type: :service do
  subject do
    described_class.new(base_date)
  end

  let!(:customers) do
    [
      create(:customer, :crossfiter_x2),
      create(:customer, :crossfiter_x2)
    ]
  end

  describe "#generate_invoices" do
    before do
      subject.generate_invoices
    end
    let(:invoices) { Invoice.in_period(base_date) }

    context "March invoices. Due in April" do
      let(:base_date) { Date.new(2019, 3, 4) }
      it { expect(invoices.map(&:period)).to all(eq('2019/04')) }
      it { expect(invoices.map(&:paid?)).to all(be_falsey) }
      it { expect(invoices.map(&:due?)).to all(be_falsey) }
    end

    context "May invoices. Due in June" do
      let(:base_date) { Date.new(2019, 5, 23) }

      it { expect(invoices.map(&:period)).to all(eq('2019/06')) }
      it { expect(invoices.pluck(:amount)).to all(eq(800.0)) }
      it { expect(invoices.map(&:paid?)).to all(be_falsey) }
      it { expect(invoices.map(&:due?)).to all(be_falsey) }
    end

  end
end
