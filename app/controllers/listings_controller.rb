class ListingsController < ApplicationController
  before_action :find_listing, only: [:show, :edit, :update, :send_buy_msg, :destroy, :haggle, :contact, :send_haggle_msg, :send_contact_msg]
  before_action :authenticate_user!, except: [:home, :index, :show]
  before_action :set_user

  def home
  end

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = @active_user.listings.build(safe_listing)
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
    if (@listing.user != @active_user)
      redirect_to @listing, :notice => 'You do not have permission to edit this listing.'
    end
  end

  def show
    @more = Listing.where.not(id: @listing.id).order('RANDOM()').limit(4)
  end

  def destroy
    @listing.destroy
    redirect_to root_path, :notice => 'Your listing has been deleted.'
  end

  # email methods

  def haggle
    listing_user = @listing.user
    @contact = Contact.new
  end

  def contact
    listing_user = @listing.user
    @contact = Contact.new
  end

  def send_buy_msg
    listing_user = @listing.user

    contact = Contact.new
    contact.name = "#{@active_user.first_name} #{@active_user.last_name}"
    contact.email = @active_user.email
    contact.message = "Gimme."
    contact.subject = "#{@active_user.first_name} wants your #{@listing.title}!"
    contact.to_email = listing_user.email
    contact.request = request
    if contact.deliver
      flash[:notice] = 'The seller has been notified and will get in touch with you soon!'
      redirect_to @listing
    else
      flash[:error] = 'There was an error sending your message. Please try again!'
      render :new
    end
  end

  def send_haggle_msg
    listing_user = @listing.user
    @contact = Contact.new(params[:contact])
    @contact.name = "#{@active_user.first_name} #{@active_user.last_name}"
    @contact.email = @active_user.email
    @contact.subject = "#{@active_user.first_name} is interested in your #{@listing.title}!"
    @contact.to_email = listing_user.email
    @contact.request = request

    if @contact.deliver
      flash[:notice] = 'The seller has received your message. Happy haggling!'
      redirect_to @listing
    else
      flash[:error] = 'There was an error sending your message. Please try again!'
      render :new
    end
  end

  def send_contact_msg
    listing_user = @listing.user
    @contact = Contact.new(params[:contact])
    @contact.name = "#{@active_user.first_name} #{@active_user.last_name}"
    @contact.email = @active_user.email
    @contact.subject = "#{@active_user.first_name} has a question about your #{@listing.title}!"
    @contact.to_email = listing_user.email
    @contact.request = request

    if @contact.deliver
      flash[:notice] = 'The seller has received your message!'
      redirect_to @listing
    else
      flash[:error] = 'There was an error sending your message. Please try again!'
      render :new
    end
  end

  private
    def find_listing 
      @listing = Listing.find params[:id] ? params[:id] : params[:listing_id]
    end

    def safe_listing
      params.require(:listing).permit(:title, :story, :price, :image, :image2, :image3)
    end

    # email safe params
    def contacts_safe_params
      params.require(:contact).permit(:name, :email, :message)
    end
end