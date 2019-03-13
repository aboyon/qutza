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
end
