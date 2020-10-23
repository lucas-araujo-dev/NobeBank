class CancelAccountsController < ApplicationController
  def destroy
    current_user.bank_account.update(enabled?: false)
    sign_out current_user
    redirect_to root_path
  end
end
