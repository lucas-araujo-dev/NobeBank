require "rails_helper"

RSpec.describe BankAccount, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:balance) }
    it { is_expected.to validate_presence_of(:account_number) }
    it { is_expected.to validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }
  end
end
