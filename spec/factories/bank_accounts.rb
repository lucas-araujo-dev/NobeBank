FactoryBot.define do
  factory :bank_account do
    balance { 1.5 }
    account_number { "MyString" }
    user { nil }
  end
end
