require 'rails_helper'

describe 'User can edit a specific job' do
  scenario 'a user can click on a job and then on the edit link to be taken to the edit view for that job' do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")

    visit company_path(company)
    click_on('developer')
    click_on('Edit')

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}/edit")
    expect(page).to have_content('')
  end
end
