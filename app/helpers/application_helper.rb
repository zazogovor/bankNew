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
		end
	end
	
	def euro(amount)
		number_to_currency(amount, :unit => '€')
	end
end
