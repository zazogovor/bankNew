module CustomersHelper
	def longlat?
		if @customer.latitude.nil? && @customer.longitude.nil?
			false
		else
			true
		end
	end
end
