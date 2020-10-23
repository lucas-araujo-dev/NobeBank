class WithdrawalsController < ApplicationController
  before_action :authenticate_user!

  def new
    @withdraw = Transaction.new
  end

  def create
    if current_user.valid_password?(withdraw_params[:password])
      withdraw_service = Withdraw.new(
        value: withdraw_params[:value],
        recipient: current_user.bank_account,
      )
      respond_to do |format|
        if withdraw_service.call?
          format.html { redirect_to root_path, notice: "withdraw was successfully executed." }
        else
          format.html { redirect_to new_withdrawal_path, notice: "There was an error with your withdraw." }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to new_withdrawal_path, notice: "Incorrect password" }
      end
    end
  end

  private

  def withdraw_params
    params.require(:transaction).permit(:value, :password)
  end
end
