require 'rails_helper'

describe 'User' do
  it 'can create a new company contact through the company show page' do
    company = Company.create!(name: "ESPN")
    name = 'Jenny'
    position = 'Hiring Manager'
    email = 'Jenny@org.org'

    visit(company_path(company))
    save_and_open_page
    fill_in('comment[name]', with: name)
    fill_in(:position, with: position)
    fill_in(:email, with: email)
    click_on('Create Contact')

    expect(page).to have_content(name)
    expect(page).to have_content(position)
    expect(page).to have_content(email)
  end
end
