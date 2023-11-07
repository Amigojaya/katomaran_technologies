class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings

  def admin?
    role == 'admin'
  end

  def super_admin?
    role == 'super_admin'
  end

  def user?
    role == 'user'
  end
end
