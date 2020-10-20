require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    let (:user) { create(:user) }

    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }

    context "when user is created" do
      it "is created an account" do
        expect(user.bank_account).not_to be_nil
      end
    end
  end
end
