FactoryBot.define do
  factory :bank_account do
    balance { FFaker::Random.rand(1000.0..2000.0).round(2) }
    user
  end
end
