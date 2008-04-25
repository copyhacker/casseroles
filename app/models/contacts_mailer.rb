class ContactsMailer < ActionMailer::Base
  def signup(contact, sent_at = Time.now)
    @subject    = 'New Contact: Thank you for your interest in Caring Casseroles!'
    @body       = { :contact => contact }
    @recipients = "#{contact.first_name} #{contact.last_name} <#{contact.email}>"
    @bcc        = 'april@caringcasseroles.org'
    @from       = 'contact@caringcasseroles.org'
    @sent_on    = sent_at
    @headers    = {}
  end

  # def notify_admin(contact, sent_at = Time.now)
  #   @subject    = "#{contact.first_name} #{contact.last_name} has signed up for Caring Casseroles"
  #   @body       = { :contact => contact }
  #   @recipients = 'april@caringcasseroles.org'
  #   @from       = 'contact@caringcasseroles.org'
  #   @sent_on    = sent_at
  #   @headers    = {}
  # end
end
