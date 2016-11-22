class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.date :due_date
      t.string :security_number
      t.integer :account_id

      t.timestamps
    end
  end
end
