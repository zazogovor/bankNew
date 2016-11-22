class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.date :date_of_birth
      t.string :telephone
      t.string :address
      t.string :city
      t.string :country
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
