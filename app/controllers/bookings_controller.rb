class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: %i[ show edit update destroy ]
  include BookingsHelper

  def index
    @bookings = current_user.bookings.order(:created_at)
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def update
    if @booking.update(status: params[:booking][:status])
      redirect_to all_bookings_bookings_path, notice: 'Booking Status was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @booking = Booking.new(booking_params.merge({user_id: current_user.id}))

    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_path, notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def all_bookings
    @bookings = Booking.all.order(:created_at)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:booking_date)
    end
end
