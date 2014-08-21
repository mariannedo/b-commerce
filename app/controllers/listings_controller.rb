class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show]
  before_action :set_user

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = @user.listings.build(safe_listing)
    if @listing.save
      flash[:notice] = "Listing saved successfully"
      redirect_to @listing
    else
      flash[:notice] = "Error saving listing. Please try again."
      render 'new'
    end
  end

  def update
    if @listing.update safe_listing
      flash[:notice] = "Listing edited successfully"
      redirect_to @listing
    else 
      render 'edit'
    end
  end

  def edit
  end

  def show
  end

  private
    def find_listing 
      @listing = Listing.find params[:id]
    end

    def safe_listing
      params.require(:listing).permit(:title, :story, :price, :image)
    end
end