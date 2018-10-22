class ListingsController < ApplicationController
#add routes for favorites and relevants

  # before_action :locate_listing, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def favourites
  #  redirect_to listings_favourites_path
    # @favourite_listings=Listing.all
    #to be changed to listings.where(parameters...)
  end

  def relevant
    # redirect_to listings_relevant_path
    # @relevant_listings=Listing.all
    #to be changed to listings.where(parameters...)
  end

  def index
    @listings=Listing.all
  end

  def edit
     @listing=Listing.find(params[:id])
  end

  def show
     @listing=Listing.find(params[:id])
  end

  def update
     @listing=Listing.find(params[:id])
    @listing.update(listing_params)
    if @listing.valid?
      redirect_to listing_path
    else
      flash[:errors]=@listing.errors.full_messages
      redirect_to edit_listing_path
    end
  end

  def new
    @listing=Listing.new
  end

  def create
    @listing=Listing.create(listing_params)
    if @listing.valid?
      redirect_to listing_path
    else
      flash[:errors]=@listing.errors.full_messages
      redirect_to new_listing_path
    end
  end

  def destroy
     @listing=Listing.find(params[:id])
    @listing.delete
    redirect_to
    #do not let the user browse without an active advertisement
  end


  private

  # def locate_listing
  #
  # end

  def listing_params
    params.require(:listing).permit(:description, :title, :date, :landlord_name, :landlord_info, :landlord_phone, :landlord_email, :address_id, :picture_url)
  end

end
