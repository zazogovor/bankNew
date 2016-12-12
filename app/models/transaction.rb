class Transaction < ActiveRecord::Base
	belongs_to :account
	#belongs_to :account, class_name: "account", foreign_key: "transferee_id" 
	
	def transferAccount()
		@transferee = Account.find_by_id(self.transferee_id)
	end
	
	#Method to process a transaction in the database
	#It is meant to deduct the transaction amount from sender, and add the amount to receiver
	def processTransaction(transaction)
		senderAccount = Account.find_by_id(transaction.account_id)
		receiverAccount = Account.find_by_id(transaction.transferee_id)
		
		senderAccount.balance -= amount
		receiverAccount.balance += amount
		
		senderAccount.save
		receiverAccount.save
	end
	
	def self.search(query)
		where("created_at LIKE ?", "%#{query}%")
	end
end
