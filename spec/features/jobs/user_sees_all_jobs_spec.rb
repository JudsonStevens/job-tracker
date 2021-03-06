require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'Web')
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_jobs_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
    expect(page).to have_content("Create a New Job for #{company.name}")
  end

  scenario "a user can click on a specific job to be taken to the show page for that job" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'Web')
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "Denver", category_id: category.id)
    job = Job.all.first

    visit company_jobs_path(company)
    click_on('Developer')

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content('Denver')
    expect(page).to have_content(70)
    expect(page).to have_content('Developer')
  end

  scenario 'and can click on a job and then on the edit link to be taken to the edit view for that job' do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'Web')
    job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "Denver", category_id: category.id)

    visit company_jobs_path(company)
    click_on('Developer')
    click_on('Update This Job')

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job_1.id}/edit")
  end
end

describe "User fails to supply params" do
  scenario 'so the user gets redirected to the dashboard' do
    visit jobs_path('')

    expect(current_path).to eq(companies_path)
  end
end

