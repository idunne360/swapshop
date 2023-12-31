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
    @listing = current_user.listings.new(params.require(:listing).permit(:title, :description, :price, :date))
    if @listing.save
      flash[:notice] = "#{@listing.title} successfully posted"
      redirect_to listings_path and return
    else
      flash[:alert] = "Creation failed, invalid input"
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    if @listing.update(create_update_params)
      flash[:notice] = "#{@listing.title} successfully edited"
      redirect_to listing_path(@listing) and return
    else 
      flash[:alert] = "Edit Failed"
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy
    flash[:alert] = "Listing #{@listing.title} deleted."
    redirect_to listings_path
  end

  def accept_offer
    @listing = Listing.find(params[:id])
    @comment = @listing.comments.find(params[:comment_id])
    @comment.update(accepted: true)
    @listing.destroy
    flash[:notice] = "Offer accepted. Listing sold!"
    redirect_to listings_path
  end

  private
  def create_update_params
    params.require(:listing).permit(:title, :price, :description, :date, :poster)
  end

end
