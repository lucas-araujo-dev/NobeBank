class WithdrawalsController < ApplicationController
  before_action :authenticate_user!

  def new
    @withdraw = Transaction.new
  end

  def create
    withdraw_service = Withdraw.new(
      value: withdraw_params[:value],
      recipient: current_user.bank_account,
    )
    respond_to do |format|
      if withdraw_service.call?
        format.html { redirect_to root_path, notice: "withdraw was successfully executed." }
      else
        format.html { render :new, notice: "There was an error with your withdraw." }
      end
    end
  end

  private

  def withdraw_params
    params.require(:transaction).permit(:value)
  end
end
