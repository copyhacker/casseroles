class ContactsController < ActionController::Base
  def new; end
  
  def create
    @contact = Contact.create params[:contact]
    ContactsMailer.deliver_signup @contact
    # ContactsMailer.deliver_notify_admin @contact
    flash[:notice] = 'Thank you for signing up!'
    render :action => 'new'
  end
end