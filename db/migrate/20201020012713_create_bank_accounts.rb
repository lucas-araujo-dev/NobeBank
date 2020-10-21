class CreateBankAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :bank_accounts do |t|
      t.float :balance
      t.string :account_number
      t.boolean :enabled?, default: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
