class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"fbfb6123@gmail.com",subject: "confirmation"
  end
end
