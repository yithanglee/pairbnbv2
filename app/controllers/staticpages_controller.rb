class StaticpagesController < ApplicationController
  def home
  		@listings = Listing.all
  	if signed_in?
  		@user = current_user.id
  	else
  	end

  end

  def help
  end
end
