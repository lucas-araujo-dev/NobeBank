class DepositsController < ApplicationController
  before_action :authenticate_user!

  def new
    @deposit = current_user.bank_account.transactions.new
  end

  private

  def deposit_params
    params.require(:deposit)
      .permit()
  end
end
