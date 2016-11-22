class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :account_id
      t.integer :transferee_id
      t.decimal :amount

      t.timestamps
    end
  end
end
