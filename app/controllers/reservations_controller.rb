class ReservationsController < ApplicationController
  # GET users/1/listings
  def index
  end


  # GET users/1/listings/new
  def new
    @listing = Listing.find(params["listing_id"])
    @url = '/listings/'+ @listing.id.to_s + '/reservations'
  end


  # POST users/1/listings
  def create

    y = params["q"]["checkin(1i)"].to_i
    m = params["q"]["checkin(2i)"].to_i 
    d = params["q"]["checkin(3i)"].to_i
    @checkin = Date.new(y,m,d)

    y = params["q"]["checkout(1i)"].to_i
    m = params["q"]["checkout(2i)"].to_i 
    d = params["q"]["checkout(3i)"].to_i
    @checkout = Date.new(y,m,d)

    @listing = Listing.find(params["listing_id"])
    @nights = @listing.reservations.create(checkin:@checkin, listing_id:@listing.id, user_id:current_user.id)

for i in @checkin...@checkout do @nights.reservation_dates.create(staying_dates:i) end

   @host = "damiennext706@gmail.com"

    # ReservationMailer.notification_email(current_user.email, @host, @listing.id, @listing.reservations.last.id).deliver_later
    ReservationJob.perform_later(current_user.email, @host, @listing.id, @listing.reservations.last.id)
    # ReservationMailer to send a notification email after save
   
    redirect_to listing_reservation_path(@listing.id, @nights.id)   
  end



  # GET users/1/listings/1/edit
  def edit
  end

  # GET users/1/listings/1
  def show
    @booking = Reservation.find(params["id"]) 
    @nights =  @booking.reservation_dates
  end
  # PUT users/1/listings/1
  def update
  end

  # DELETE users/1/listings/1
  def destroy
  end



end
