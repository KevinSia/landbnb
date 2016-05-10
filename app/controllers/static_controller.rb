class StaticController < ApplicationController
  def home
  end

  def dashboard
  end

  def tag
    @listings = Listing.tagged_with(params[:tag])
    render template: 'listings/index'
  end

end
