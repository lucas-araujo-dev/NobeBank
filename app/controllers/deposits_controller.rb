class DepositsController < ApplicationController
  before_action :authenticate_user!

  def new
    @deposit = Transaction.new
  end

  def create
    deposit_service = Deposit.new(
      value: deposit_params[:value],
      recipient: current_user.bank_account,
    )
    respond_to do |format|
      if deposit_service.call?
        format.html { redirect_to root_path, notice: "Deposit was successfully deposited." }
      else
        format.html { render :new, notice: "There was an error with your deposit." }
      end
    end
  end

  private

  def deposit_params
    params.require(:transaction).permit(:value)
  end
end
