class Employee < ActiveRecord::Base
	has_secure_password
	
	
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :email, uniqueness: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
end
