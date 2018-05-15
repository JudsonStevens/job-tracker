class ChangeCompanyContactTableName < ActiveRecord::Migration[5.1]
  def change
    rename_table :company_contacts, :contacts
  end
end
