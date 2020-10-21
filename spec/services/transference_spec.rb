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

      context "when is not working time" do
        let(:recipient) { create(:bank_account) }
        let(:sender) { create(:bank_account) }
        let(:value) { FFaker::Random.rand(100.0..500.0).round(2) }
        let(:value_bigger_thousand) { FFaker::Random.rand(1000.0..1500.0).round(2) }

        before do
          travel_to Time.zone.parse("2020-10-20 23:33:43")
          @transference = Transference.new(
            value: value,
            recipient: recipient,
            sender: sender,
          )

          @transference_bigger_value = Transference.new(
            value: value_bigger_thousand,
            recipient: recipient,
            sender: sender,
          )
        end

        it "does create transference out of working time" do
          expect {
            @transference.call?
          }.to change(Transaction, :count).by(1)
        end

        it "verifies if .call returns true" do
          expect(@transference.call?).to be_truthy
        end

        it "does create transference with value over than a thousand" do
          new_balance_sender = sender.balance - value_bigger_thousand - 10 - 7
          new_balance_recipient = recipient.balance + value_bigger_thousand
          @transference_bigger_value.call?
          expect(sender.reload.balance).to eq(new_balance_sender)
          expect(recipient.reload.balance).to eq(new_balance_recipient)
        end

        it "does create transference with value lower than a thousand" do
          new_balance_sender = sender.balance - value - 7
          new_balance_recipient = recipient.balance + value
          @transference.call?
          expect(sender.reload.balance).to eq(new_balance_sender)
          expect(recipient.reload.balance).to eq(new_balance_recipient)
        end
      end
      context "when is in working time" do
        let(:recipient) { create(:bank_account) }
        let(:sender) { create(:bank_account) }
        let(:value) { FFaker::Random.rand(100.0..500.0).round(2) }
        let(:value_bigger_thousand) { FFaker::Random.rand(1000.0..1500.0).round(2) }

        before do
          travel_to Time.zone.parse("2020-10-20 12:32:42")
          @transference = Transference.new(
            value: value,
            recipient: recipient,
            sender: sender,
          )

          @transference_bigger_value = Transference.new(
            value: value_bigger_thousand,
            recipient: recipient,
            sender: sender,
          )
        end

        it "does create transference in working time" do
          expect {
            @transference.call?
          }.to change(Transaction, :count).by(1)
        end

        it "verifies if .call returns true" do
          expect(@transference.call?).to be_truthy
        end

        it "does create transference with value over than a thousand" do
          new_balance_sender = sender.balance - value_bigger_thousand - 10 - 5
          new_balance_recipient = recipient.balance + value_bigger_thousand
          @transference_bigger_value.call?
          expect(sender.reload.balance).to eq(new_balance_sender)
          expect(recipient.reload.balance).to eq(new_balance_recipient)
        end

        it "does create transference with value lower than a thousand" do
          new_balance_sender = sender.balance - value - 5
          new_balance_recipient = recipient.balance + value
          @transference.call?
          expect(sender.reload.balance).to eq(new_balance_sender)
          expect(recipient.reload.balance).to eq(new_balance_recipient)
        end
      end
    end
  end
end
