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

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(params.require(:listing).permit(:title, :description, :price, :date)) #add poster once usernames implemented
    if @listing.save
      flash[:notice] = "#{@listing.title} successfully posted"
      redirect_to listings_path and return
    else
      flash[:alert] = "Creation failed, invalid input"
      render 'new', status: :unprocessable_entity
    end
  end

end
