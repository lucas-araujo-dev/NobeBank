require "rails_helper"

RSpec.describe Withdraw do
  describe ".call?" do
    context "when call is true" do
      let(:bank_account) { create(:bank_account) }
      let(:value) { FFaker::Random.rand(100.0..500.0).round(2) }

      it "does create Withdraw with valid params" do
        withdraw = Withdraw.new(value: value, recipient: bank_account)
        expect(withdraw.call?).to be_truthy
      end
    end
    context "when call is false" do
      let(:bank_account) { create(:bank_account) }
      let(:value) { FFaker::Random.rand(10000.0..50000.0).round(2) }

      it "does not create Withdraw with invalid params" do
        withdraw = Withdraw.new(value: value, recipient: bank_account)
        expect(withdraw.call?).to be_falsey
      end
    end

    context "when withdraw is made " do
      let(:bank_account) { create(:bank_account) }
      let(:value) { FFaker::Random.rand(100.0..500.0).round(2) }
      before do
        @withdraw = Withdraw.new(value: value, recipient: bank_account)
      end
      it "does create withdraw" do
        new_balance_recipient = bank_account.balance - value
        @withdraw.call?
        expect(bank_account.reload.balance).to eq(new_balance_recipient)
      end
    end
  end
end
