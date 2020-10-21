class HomeController < ApplicationController
  def index
    @bank_accounts = BankAccount.all
  end

  def show
    @bank_account = BankAccount.find_by_id(params[:id])
  end
end
