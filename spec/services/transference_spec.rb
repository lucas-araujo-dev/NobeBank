require "rails_helper"

RSpec.describe Transference do
  describe ".call?" do
    context "when call is true" do
      let(:recipient) { create(:bank_account) }
      let(:sender) { create(:bank_account) }
      let(:value) { FFaker::Random.rand(100.0..500.0).round(2) }

      it "does create Transference with valid params" do
        transference = Transference.new(
          value: value,
          recipient: recipient,
          sender: sender,
        )
        expect(transference.call?).to be_truthy
      end
    end
    context "when call is false" do
      let(:recipient) { create(:bank_account) }
      let(:sender) { create(:bank_account) }
      let(:value) { FFaker::Random.rand(10000.0..50000.0).round(2) }

      it "does not create Transference with invalid params" do
        transference = Transference.new(
          value: value,
          recipient: recipient,
          sender: sender,
        )
        expect(transference.call?).to be_falsey
      end
    end
  end
end
