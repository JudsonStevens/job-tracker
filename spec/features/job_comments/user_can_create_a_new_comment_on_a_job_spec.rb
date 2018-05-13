require 'rails_helper'

describe 'User can create a new comment' do
  scenario 'about a specific job by filling in the content field and clicking submit' do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'Web')
    job = company.jobs.create!(title: "Developer", description: 'Great job', level_of_interest: 70, category_id: category.id, city: "Denver")

    visit(company_job_path(company, job))

    fill_in('job_comment[content]', with: "I can't believe you've done this")
    click_on('Create Job Comment')

    expect(current_path).to eq('/companies/#{company.id)/jobs/#{job.id}')
    expect(page).to have_content("I can't believe you've done this")
  end
end
