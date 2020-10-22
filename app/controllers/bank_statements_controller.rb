require "date"

class BankStatementsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = []

    @transactions = TransactionQuery.find_between_dates(
      initial_date: bank_statement_params[:initial_date].to_date,
      final_date: bank_statement_params[:final_date].to_date,
      bank_account: current_user.bank_account,
    ) if bank_statement_params[:initial_date] && bank_statement_params[:final_date]
  end

  private

  def bank_statement_params
    params.permit(:initial_date, :final_date)
  end
end
