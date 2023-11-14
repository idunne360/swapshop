class CommentsController < ApplicationController
    before_action :authenticate_user!

  def new
    # listing_id because of nested route
    @listing = Listing.find(params[:listing_id])
    @comment = Comment.new
  end

  def create
    # book_id because of nested route
    @listing = Listing.find(params[:listing_id])
     # build sets the book foreign key automatically
    @comment = @listing.comments.build(create_update_params)
    
    @comment.user = current_user
    
    if @comment.save
      flash[:notice] = 'Comment successfully created.'
      redirect_to(listing_path(@listing))
      
      
    else
      flash[:alert] = 'Failure to create new comment.'
      render :new, status: :unprocessable_entity
      # redirect_to(new_listing_comment_path(@listing))
    end
  end

  private
  def create_update_params
    params.require(:comment).permit(:commentText, :offer)
  end


end
