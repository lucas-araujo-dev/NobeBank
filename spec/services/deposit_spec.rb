require "rails_helper"

RSpec.describe Deposit do
  describe ".call?" do
    context "when call is true" do
      let(:bank_account) { create(:bank_account) }
      let(:value) { FFaker::Random.rand(100.0..500.0).round(2) }

      it "does create Deposit with valid params" do
        deposit = Deposit.new(value: value, recipient: bank_account)
        expect(deposit.call?).to be_truthy
      end
    end
    context "when call is false" do
      let(:bank_account) { create(:bank_account) }
      let(:value) { FFaker::Random.rand(-100.0..-10.0).round(2) }

      it "does not create Deposit with invalid params" do
        deposit = Deposit.new(value: value, recipient: bank_account)
        expect(deposit.call?).to be_falsey
      end
    end
  end
end
