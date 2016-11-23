module ApplicationHelper
	def signed_in?
		if session[:customer_id].nil?
			return
		else
			@current_customer = Customer.find_by_id(session[:customer_id])
		end
	end
	
	def employeesigned_in?
		if session[:employee_id].nil?
			return
		else
			@current_employee = Employee.find_by_id(session[:employee_id])
			
			@accounts = @current_customer.accounts
			
			@cards = []
			@accounts.each do |account|
				account.cards.each do |card|
					@cards << card                    #this stores each 'card' in @cards
				end
			end
			
			@transactions = []
			@accounts.each do |account|
				account.transactions.each do |transaction|
					@transactions << transaction
				end
			end
		end
	end
	
	def euro(amount)
		number_to_currency(amount, :unit => '€')
	end
	
	
end
