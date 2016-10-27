class ListingsController < ApplicationController
  before_action :set_listings
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET users/1/listings
  def index
  
    @listings = @user.listings
  end

  # GET users/1/listings/1
  def show

    @listing = Listing.find(params["id"])
    @staying_dates = ReservationDate.all
    @url = '/listings/'+ @listing.id.to_s + '/reservations'
  end

  # GET users/1/listings/new
  def new
    @listing = @user.listings.build
  end

  # GET users/1/listings/1/edit
  def edit
  end

  # POST users/1/listings
  def create
    @listing = @user.listings.build(listing_params)
byebug
    if @listing.save
      redirect_to([@listing.user, @listing], notice: 'Listing was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT users/1/listings/1
  def update
    if @listing.update_attributes(listing_params)
          @listing.listing_tags.destroy_all
    tags = params["tags"]["label"].split(' ')
    tags.each do |x|
        if Tag.find_by(name:x).nil?
          t = @listing.tags.create(name:x)
        else
          t = @listing.listing_tags.create(tag_id:Tag.find_by(name:x).id)
        end
      end

      redirect_to([@listing.user, @listing], notice: 'Listing was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE users/1/listings/1
  def destroy
    @listing.destroy

    redirect_to user_listings_url(@user)
  end

  def search
        @listings = Listing.search(params[:term], fields: ["title", "location"], mispellings: {below: 5})
        if @listings.blank?
          redirect_to listings_path, flash:{danger: "no successful search result"}
        else
          render :index
        end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listings
      if params[:user_id].nil?
        @user = User.find(current_user.id)
      else
      @user = User.find(params[:user_id])
      end
    end

    def set_listing
      @listing = @user.listings.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def listing_params
      params.require(:listing).permit(:title, :description, :location, :price, :availability,  {avatars: []}, :name)
    end
end
