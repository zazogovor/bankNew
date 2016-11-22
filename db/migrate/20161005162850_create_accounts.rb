class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.float :balance
      t.integer :customer_id

      t.timestamps
    end
  end
end
