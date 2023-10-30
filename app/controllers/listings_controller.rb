class ListingsController < ApplicationController
  def index
    searchfield = params[:title_search]
    @listings = if params[:title_search]
      Listing.title_search(searchfield)
    else
      Listing.all.order(params[:sort]) # order(title: :desc)
    end
    
  end

  def show
    @listing = Listing.find(params[:id])
  end

end
