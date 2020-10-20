class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true
  validates_uniqueness_of :email

  has_one :account, dependent: :destroy

  after_create :create_account

  private

  def create_account
    @ac = bank_account.new(user: self, balance: 0)
    unless @ac.save
      raise "Bank account could not be created"
    end
  end
end
