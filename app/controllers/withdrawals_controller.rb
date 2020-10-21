class WithdrawalsController < ApplicationController
  before_action :authenticate_user!

  def new
    @withdraw = current_user.bank_account.transactions.new
  end
end
