class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true
  validates :password, presence: true
  validates_uniqueness_of :email

  has_one :bank_account, dependent: :destroy

  after_create :create_account

  def active_for_authentication?
    super && bank_account.enabled?
  end

  private

  def create_account
    @ac = BankAccount.new(user: self, balance: 0)
    unless @ac.save
      raise "Bank account could not be created"
    end
  end
end
