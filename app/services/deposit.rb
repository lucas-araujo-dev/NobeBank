class Deposit
  attr_reader :value, :recipient

  def initialize(value:, recipient:)
    @value = value
    @recipient = recipient
  end

  def call?
    ActiveRecord::Base.transaction do
      begin
        @recipient.update(balance: new_balance)
        deposit_params
      rescue ActiveRecord::RecordInvalid
        raise ActiveRecord::Rollback
      end
    end
  end

  private

  def new_balance
    @recipient.balance + @value.to_f
  end

  def deposit_params
    Transaction.create!(
      value: @value,
      recipient: @recipient,
      sender: @recipient,
      kind: Transaction.kinds[:deposit],
    )
  end
end
