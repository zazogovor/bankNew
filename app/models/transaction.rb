class Transaction < ActiveRecord::Base
	belongs_to :account
	#belongs_to :account, class_name: "account", foreign_key: "transferee_id" 
	
	def transferAccount()
		@transferee = Account.find_by_id(self.transferee_id)
	end
end
