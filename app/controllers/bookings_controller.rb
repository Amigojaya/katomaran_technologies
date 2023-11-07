class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[ show edit update destroy ]
  include BookingsHelper

  def index
    authorize current_user, policy_class: UserPolicy

    @bookings = current_user.bookings.where('booking_date > ?', Date.today).order(:created_at)
  rescue Pundit::NotAuthorizedError
    flash[:alert] = "You are Blocked or Not authorized to this page"
    redirect_to root_path
  end

  def new
    authorize current_user, policy_class: UserPolicy

    @booking = Booking.new
  rescue Pundit::NotAuthorizedError
    flash[:alert] = "You are Blocked or Not authorized to this page"
    redirect_to root_path
  end

  def edit
    authorize current_user, policy_class: UserPolicy
  end

  def update
    authorize current_user, policy_class: UserPolicy

    if @booking.update(status: params[:booking][:status])
      redirect_to all_bookings_bookings_path, notice: 'Booking Status was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    authorize current_user, policy_class: UserPolicy

    @booking = Booking.new(booking_params.merge({user_id: current_user.id}))

    if @booking.save
      redirect_to bookings_path, notice: "Booking was successfully created." 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def all_bookings
    authorize current_user, policy_class: UserPolicy
    
    @bookings = Booking.where('booking_date > ?', Date.today).order(:created_at)
  end

  def search
    @bookings = Booking.search(
      params[:search],
      where: {
        booking_date: { gt: Date.today }
      }
    )
    @bookings = Booking.search(where: { booking_date: { gt: Date.today }}) unless params[:search].present?
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:booking_date, :name)
    end
end
