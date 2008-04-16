class ContactsController < ActionController::Base
  def new; end
  
  def create
    Contact.create params[:contact]
    flash[:notice] = 'Thank you for signing up!'
    render :action => 'new'
  end
end