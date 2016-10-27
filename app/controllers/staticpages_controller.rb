class StaticpagesController < ApplicationController
  def home

  	if signed_in?
  		@user = current_user.id
      @listings = Listing.where.not(user_id: current_user.id)
      @listings_my = current_user.listings
  	else
      @listings = Listing.all
  	end

  end

  def help
  end

  def profile

  end

  def update
  	# byebug
  	# @profile = User.find(current_user.id)
  	# @profile.update_attributes(listing_params)
  	# if @profile.save
  	# redirect_to root_url
   #  else
   #    render :help
   #  end
  end


private
	# def listing_params
	# 	  params.permit({avatars: []})
	# end
end
