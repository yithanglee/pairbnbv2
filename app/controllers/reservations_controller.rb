class ReservationsController < ApplicationController
  # GET users/1/listings
  def index
        @listing = Listing.find(params["listing_id"])
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
    @booked_dates = []
      @listing.reservations.each do |x|
        x.reservation_dates.each do |y|
          @booked_dates << y.staying_dates
        end
      end
    
    @query_dates = []
      for i in @checkin...@checkout do @query_dates << i end

      c = @query_dates.map {|x| @booked_dates.include? x}

      if c.include? true
      redirect_to user_listing_path(@listing.user.id, @listing.id) 
        else

      @nights = @listing.reservations.create(checkin:@checkin, listing_id:@listing.id, user_id:current_user.id)
      for i in @checkin...@checkout do @nights.reservation_dates.create(staying_dates:i) end

    # @host = @listing.user.email

    # ReservationJob.perform_later(current_user.email, @host, @listing.id, @listing.reservations.last.id)
        redirect_to user_listing_path(@listing.user.id, @listing.id) 
 


    end  
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
