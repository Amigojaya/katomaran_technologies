class Booking < ApplicationRecord
	validates :booking_date, presence: true
	validate :validating_booking_date

	belongs_to :user

	def validating_booking_date
    if booking_date.present? && booking_date.to_date < Date.today
      errors.add(:booking_date, "must be greater than today date")
    end
  end
end
