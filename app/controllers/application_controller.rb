class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include ApplicationHelper
  
	def authorise
		unless signed_in?
			store_location
			redirect_to login_path, :notice => "Please log in first."
		end
	end
	
	def employeeauthorise
		unless employeesigned_in?
			store_location
			redirect_to employeelogin_path, notice: "You must be logged in as a Employee to complete this action"
		end
	end
	
	private
		def store_location
			session[:return_to] = request.fullpath
		end
end
