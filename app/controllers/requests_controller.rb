class RequestsController < ApplicationController
  before_action :find_request, only: [:show, :edit, :update, :destroy, :contact, :send_contact_msg]
  before_action :authenticate_user!, except: [:index]
  before_action :set_user

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = @active_user.requests.build(safe_request)
    if @request.save
      flash[:notice] = "Response saved successfully"
      redirect_to requests_path
    else
      flash[:notice] = "Error saving response. Please try again."
      render 'new'
    end
  end

  def update
    if @request.update safe_request
      flash[:notice] = "Request edited successfully"
      redirect_to requests_path
    else 
      render 'edit'
    end
  end

  def edit
    if (@request.user != @active_user)
      redirect_to @request, :notice => 'You do not have permission to edit this request.'
    end
  end

  def show
    redirect_to requests_path
  end

  def destroy
    @request.destroy
    redirect_to root_path, :notice => 'Your request has been deleted.'
  end

  def contact
    request_user = @request.user
    @contact = Contact.new
  end

  # email methods 

  def send_contact_msg
    borrower = @request.user
    @contact = Contact.new(params[:contact])
    @contact.name = "#{@active_user.first_name} #{@active_user.last_name}"
    @contact.email = @active_user.email
    @contact.subject = "#{@active_user.first_name} has #{@request.item}!"
    @contact.to_email = borrower.email
    @contact.request = request

    if @contact.deliver
      flash[:notice] = "Your message has been sent to #{borrower.first_name}!"
      redirect_to requests_path
    else
      flash[:error] = 'There was an error sending your message. Please try again!'
      render :new
    end
  end

  private
    def find_request 
      @request = Request.find params[:id] ? params[:id] : params[:request_id]
    end

    def safe_request
      params.require(:request).permit(:item, :description)
    end

end
