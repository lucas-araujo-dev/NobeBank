require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:kind)  }
    it { is_expected.to validate_presence_of(:value) }

    it { is_expected.to validate_numericality_of(:value).is_greater_than_or_equal_to(0) }
    
    it { is_expected.to belong_to(:recipient) }
    it { is_expected.to belong_to(:sender)    }
  end
end
