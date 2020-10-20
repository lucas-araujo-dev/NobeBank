class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :recipient, null: false, foreign_key: { to_table: 'bank_accounts' }
      t.references :sender, null: false, foreign_key: { to_table: 'bank_accounts' }
      t.integer :kind, null: false
      t.float :value

      t.timestamps
    end
  end
end
