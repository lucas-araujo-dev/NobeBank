class Transference
  attr_reader :value, :recipient, :sender

  def initialize(value:, recipient:, sender:)
    @value = value
    @recipient = recipient
    @sender = sender
  end

  def call?
    ActiveRecord::Base.transaction do
      begin
        remove_from_sender
        add_to_recipient
        Transaction.create!(
          value: @value,
          recipient: @recipient,
          sender: @sender,
          kind: Transaction.kinds[:transference],
        )
      rescue ActiveRecord::RecordInvalid
        raise ActiveRecord::Rollback
      end
    end
  end

  private

  def remove_from_sender
    @sender.update!(balance: new_balance_sender)
  end

  def add_to_recipient
    @recipient.update!(balance: new_balance_recipient)
  end

  def new_balance_sender
    @sender.balance - @value
  end

  def new_balance_recipient
    @recipient.balance + @value
  end
end
