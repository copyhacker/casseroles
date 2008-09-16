class ContactsController < ApplicationController
  before_filter :login_required, :only => :index

  def new; end
  
  def create
    @contact = Contact.create params[:contact]
    ContactsMailer.deliver_signup @contact
    # ContactsMailer.deliver_notify_admin @contact
    flash[:notice] = 'Thank you for signing up!'
    render :action => 'new'
  end
  
  def index
    @contacts = Contact.find(:all, :order => 'last_name')
  end

  def authorized?
    logged_in? && current_user.admin?
  end
end