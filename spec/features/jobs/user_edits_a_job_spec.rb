require 'rails_helper'

describe 'User can edit a specific job' do
  scenario 'by clicking on a job and then on the edit link to be taken to the edit view for that job' do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'Web')
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

    visit company_jobs_path(company)
    click_on('Developer')
    click_on('Update This Job')

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job_1.id}/edit")
    expect(page).to have_content('')
  end
end
