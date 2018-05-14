class ContactsController < ApplicationController
  def create
    company = Company.find(params[:company_id])
    contact = company.contacts.new(contact_params)
    if contact.save
      flash[:success] = "New contact for #{contact.company} added!"
    else
      flash[:failure] = "You must fill in all fields for a new contact."
    end
    redirect_to company_path(contact.company)
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :position, :email)
  end
end
