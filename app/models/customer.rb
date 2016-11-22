class Customer < ActiveRecord::Base
	has_many :accounts, dependent: :destroy
	
	has_secure_password
	
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :country, presence: true
	validates :telephone, presence: true
	validates :telephone, format: {with: /\(?(08)\)?(\d{1})\)?[- ]?(\d{3})[- ]?(\d{4})/, message: "Wrong format"}
	validates :email, presence: true
	#validates :email, uniqueness: true
	validates :email, format: {with:/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/}
	validates :password, presence: true
	validates :password_confirmation, presence: true
end
