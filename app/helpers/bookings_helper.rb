module BookingsHelper
	def get_button_color(status)
		case status
		when 'pending'
			'btn-warning'
		when 'approved'
		  'btn-success'
		when 'rejected'
			'btn-danger'
		end
	end
end
