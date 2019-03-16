require 'rails_helper'

describe ApplicationHelper, type: :helper do

  describe "#render_offers" do
    let(:columns) { 3 }
    let(:items) { (1..14).to_a }
    let(:expected_rows) { 5 }
    let(:matrix) { render_offers(items, columns) }

    it { expect(matrix.size).to eq(expected_rows) }
  end
end
