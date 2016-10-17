class StaticpagesController < ApplicationController
  def home
  	@user = current_user.id
  end

  def help
  end
end
