class ListingTagsController < ApplicationController
  before_action :set_listing_tag, only: [:show, :edit, :update, :destroy]

  # GET /listing_tags
  # GET /listing_tags.json
  def index
    @listing_tags = ListingTag.all
  end

  # GET /listing_tags/1
  # GET /listing_tags/1.json
  def show
  end

  # GET /listing_tags/new
  def new
    @listing_tag = ListingTag.new
  end

  # GET /listing_tags/1/edit
  def edit
  end

  # POST /listing_tags
  # POST /listing_tags.json
  def create
    @listing_tag = ListingTag.new(listing_tag_params)

    respond_to do |format|
      if @listing_tag.save
        format.html { redirect_to @listing_tag, notice: 'Listing tag was successfully created.' }
        format.json { render :show, status: :created, location: @listing_tag }
      else
        format.html { render :new }
        format.json { render json: @listing_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listing_tags/1
  # PATCH/PUT /listing_tags/1.json
  def update
    respond_to do |format|
      if @listing_tag.update(listing_tag_params)
        format.html { redirect_to @listing_tag, notice: 'Listing tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing_tag }
      else
        format.html { render :edit }
        format.json { render json: @listing_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listing_tags/1
  # DELETE /listing_tags/1.json
  def destroy
    @listing_tag.destroy
    respond_to do |format|
      format.html { redirect_to listing_tags_url, notice: 'Listing tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing_tag
      @listing_tag = ListingTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_tag_params
      params.require(:listing_tag).permit(:listing_id, :tag_id)
    end
end
