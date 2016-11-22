class Card < ActiveRecord::Base
	belongs_to :account
	
	validates :firstname, presence: true
	validates :lastname, presence: true
	validates :due_date, presence: true
	validates :security_number, presence: true
	validates :security_number, length: { minimum: 6 }
	validates :security_number, length: { maximum: 6 }
end
