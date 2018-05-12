require 'rails_helper'

describe "User sees all jobs" do
  scenario "a user sees all the jobs for a specific company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")

    visit company_path(company)

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
<<<<<<< Updated upstream
=======
    expect(page).to have_content("Create a New Job for #{company.name}")
  end

  scenario "a user can click on a specific job to be taken to the show page for that job" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")
    job = Job.all.first

    visit company_path(company)
    click_on("Developer")

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content('Denver')
    expect(page).to have_content(70)
    expect(page).to have_content('Developer')
>>>>>>> Stashed changes
  end
end
