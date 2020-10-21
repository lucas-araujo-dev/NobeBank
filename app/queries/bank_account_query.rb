class BankAccountQuery
  def self.find_account_by_number(account_number)
    BankAccount.find_by(account_number: account_number)
  end
end
