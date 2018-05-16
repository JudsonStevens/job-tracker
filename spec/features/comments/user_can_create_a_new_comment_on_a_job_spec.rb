require 'rails_helper'

describe 'User can create a new comment' do
  scenario 'about a specific job by filling in the content field and clicking submit' do
    company = Company.create(name: "ESPN")
    category = Category.create(title: 'Web')
    job = company.jobs.create(title: "Developer", description: 'Great job', level_of_interest: 70, category_id: category.id, city: "Denver")
    comment_content = "I can't believe you've done this"
    
    visit(company_job_path(company, job))
    fill_in "comment[content]", with: comment_content
    click_on('Create Comment')

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content(comment_content)
  end

  scenario 'but leaving it blank should raise a failure message' do
    company = Company.create(name: "ESPN")
    category = Category.create(title: 'Web')
    job = company.jobs.create(title: "Developer", description: 'Great job', level_of_interest: 70, category_id: category.id, city: "Denver")

    visit(company_job_path(company, job))
    click_on('Create Comment')

    expect(page).to have_content("Make sure you fill in all fields to create a new comment")
  end
end
