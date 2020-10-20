class BankAccount < ApplicationRecord
  belongs_to :user

  validates :account_number, presence: true
  validates :balance, presence: true
  validates_numericality_of :balance, greater_than_or_equal_to: 0

  before_validation :generate_number

  private

  def generate_number
    self.number = "%05d" % self.user.id if self.user
  end
end
