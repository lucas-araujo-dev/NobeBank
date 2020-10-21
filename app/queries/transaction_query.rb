class TransactionQuery
  def self.find_between_dates(inital_date, final_date, bank_account)
    Transaction.where(created_at: initial_date.beginning_of_day..final_date.end_of_day, bank_account: bank_account)
  end
end
