class BankStatementController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
  end

  def create
    @transactions = TransactionQuery.find_between_dates(
      initial_date: statement_params[:initial_date],
      final_date: statement_params[:final_date],
      bank_account: current_user.bank_account,
    )
    respond_to do |format|
      if @transactions.any?
        format.html { render :new, notice: "Deposit was successfully deposited." }
      else
        format.html { render :new, notice: "There was an error with your deposit." }
      end
    end
  end

  private

  def statement_params
    params.require(:bank_account).permit(:account_number, :initial_date, :final_date)
  end
end
