class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :send_buy_msg]
  before_action :authenticate_user!, except: [:index, :show]
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

  # email methods

  def send_buy_msg
    listing_user = @listing.user

    contact = Contact.new
    contact.name = "#{@user.first_name} #{@user.last_name}"
    contact.email = @user.email
    contact.message = "I would like to purchase the #{@listing.title}!"
    contact.subject = "Someone would like to purchase your B-Commerce item!"
    contact.to_email = listing_user.email
    contact.request = request
    if contact.deliver
      flash[:notice] = 'The seller has been notified and will get in touch with you soon!'
      redirect_to @listing
    else
      flash[:error] = 'Cannot send message.'
      render :new
    end
  end

  private
    def find_listing 
      @listing = Listing.find params[:id] ? params[:id] : params[:listing_id]
    end

    def safe_listing
      params.require(:listing).permit(:title, :story, :price, :image)
    end

    # email safe params
    def contacts_safe_params
      params.require(:contact).permit(:name, :email, :message)
    end
end