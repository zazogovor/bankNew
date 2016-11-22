class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.date :date_of_birth
	  t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
