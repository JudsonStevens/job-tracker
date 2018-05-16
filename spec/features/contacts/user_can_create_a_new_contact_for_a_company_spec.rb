require 'rails_helper'

describe 'User' do
  it 'can create a new company contact through the company show page' do
    company = Company.create!(name: "ESPN")
    name = 'Jenny'
    position = 'Hiring Manager'
    email = 'Jenny@org.org'

    visit(company_path(company))
    fill_in('contact[name]', with: name)
    fill_in('contact[position]', with: position)
    fill_in('contact[email]', with: email)
    click_on('Create Contact')

    expect(page).to have_content(name)
    expect(page).to have_content(position)
    expect(page).to have_content(email)
  end

  it 'tries to submit a blank form which should raise a failure message' do
    company = Company.create(name: "ESPN")

    visit(company_path(company))
    click_on('Create Contact')

    expect(page).to have_content("You must fill in all fields for a new contact.")
  end

end
