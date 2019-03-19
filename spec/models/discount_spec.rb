require 'rails_helper'

describe Discount, type: :model do
  it { expect(build(:discount, :percentage)).to be_percentage }
  it { expect(build(:discount, :amount)).to be_amount }
end
