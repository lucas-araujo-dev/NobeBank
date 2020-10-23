class TransactionQuery
  def self.find_between_dates(initial_date:, final_date:, bank_account:)
    Transaction.where(created_at: initial_date.beginning_of_day..final_date.end_of_day, sender: bank_account)
  end
end
