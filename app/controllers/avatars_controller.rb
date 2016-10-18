class AvatarsController < ApplicationController
  before_action :set_avatars
  before_action :set_avatar, only: [:show, :edit, :update, :destroy]

  # GET listings/1/avatars
  def index
    @avatars = @listing.avatars
  end

  # GET listings/1/avatars/1
  def show
  end

  # GET listings/1/avatars/new
  def new
    @avatar = @listing.avatars.build
  end

  # GET listings/1/avatars/1/edit
  def edit
  end

  # POST listings/1/avatars
  def create
    @avatar = @listing.avatars.build(avatar_params)

    if @avatar.save
      redirect_to([@avatar.listing, @avatar], notice: 'Avatar was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT listings/1/avatars/1
  def update
    if @avatar.update_attributes(avatar_params)
      redirect_to([@avatar.listing, @avatar], notice: 'Avatar was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE listings/1/avatars/1
  def destroy
    @avatar.destroy

    redirect_to listing_avatars_url(@listing)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avatars
      @listing = Listing.find(params[:listing_id])
    end

    def set_avatar
      @avatar = @listing.avatars.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def avatar_params
      params.require(:avatar).permit(:avatars)
    end
end
