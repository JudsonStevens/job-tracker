require 'rails_helper'

describe "User sees one company" do
  scenario "a user sees a company" do
    company = Company.create(name: 'ESPN')
    category = Category.create(title: 'Web')
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}")
    expect(page).to have_content(company.name)
    expect(page).to have_content('Name')
    expect(page).to have_content('Existing Contacts')
  end
end
