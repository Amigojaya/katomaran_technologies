module BookingsHelper
	def get_button_color(status)
		case status
		when 'pending'
			'btn-outline-warning'
		when 'approved'
		  'btn-outline-success'
		when 'rejected'
			'btn-outline-danger'
		end
	end
end
