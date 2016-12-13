class Account < ActiveRecord::Base
	has_many :cards, dependent: :destroy
	#belongs_to :user
	belongs_to :customer
	has_many :transactions
	
	validates :balance, presence: true
	
	def self.search(query)
		where("account_type LIKE ?", "%#{query}%")
	end
end
