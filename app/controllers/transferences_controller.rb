class TransferencesController < ApplicationController
  before_action :authenticate_user!

  def new
    @transference = current_user.bank_account.transactions.new
  end
end
