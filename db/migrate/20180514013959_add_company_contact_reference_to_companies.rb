class AddCompanyContactReferenceToCompanies < ActiveRecord::Migration[5.1]
  def change
    add_reference :company_contacts, :company, index: true, foreign_key: true
  end
end
