class TransferencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipient, only: [:create]

  def new
    @transference = Transaction.new
  end

  def create
    transference_service = Transference.new(
      value: transference_params[:value],
      sender: current_user.bank_account,
      recipient: @recipient,
    )
    respond_to do |format|
      if transference_service.call?
        format.html { redirect_to root_path, notice: "Transference was successfully executed." }
      else
        format.html { render :new, notice: "There was an error with your transference." }
      end
    end
  end

  private

  def transference_params
    params.require(:transaction)
      .permit(
        :value,
        :recipient
      )
  end

  def set_recipient
    @recipient = BankAccountQuery.find_account_by_number(transference_params[:recipient])
    binding.pry
  end
end
