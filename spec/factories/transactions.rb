FactoryBot.define do
  factory :transaction do
    recipient { nil }
    sender { nil }
    value { 1.5 }
  end
end
