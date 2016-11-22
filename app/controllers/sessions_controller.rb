class SessionsController < ApplicationController
	def new
	end

	def create
		customer = Customer.find_by_email(params[:email])
		if customer && customer.authenticate(params[:password])
			session[:customer_id] = customer.id
			redirect_to root_path
		else
			flash.now[:error] = "Invalid email/password combination!"
			render 'new'
		end 
	end

	def destroy
		if signed_in?
			session[:customer_id] = nil
			redirect_to root_path, notice: "Logged out"
		else
			flash[:notice] = "You need to log in first!"
		end
	end
  
	def employeenew
	end
  
	def employeecreate
		employee = Employee.find_by_email(params[:email])
		if employee and employee.authenticate(params[:password])
			session[:employee_id] = employee.id
			redirect_to root_path
		else
			redirect_to employeelogin_path, alert: "Invalid email/password combination!"
		end
	end
	
	def employeedestroy
		session[:employee_id] = nil
		redirect_to root_path, notice: "Logged out"
	end
end
