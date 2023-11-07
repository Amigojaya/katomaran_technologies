# Super admin
User.create(email: 'super_admin@gmail.com', password: 'Password123@', role: 'super_admin')

# Admin
User.create(email: 'admin@gmail.com', password: 'Password123@', role: 'admin')

# user
user = User.create(email: 'user@gmail.com', password: 'Password123@')


# Creating sample Bookings data

Booking.create(name: "First Booking", booking_date: Time.now + 2.days, user_id: user.id)

# Reindexing because of elastic serach
Booking.reindex
