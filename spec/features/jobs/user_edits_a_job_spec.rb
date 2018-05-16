require 'rails_helper'

describe 'User can edit a specific job' do
  scenario 'by clicking on a job and then on the edit link to be taken to the edit view for that job' do
    company = Company.create(name: "ESPN")
    category = Category.create(title: 'Web')
    job_1 = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job_2 = company.jobs.create(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)

    visit company_jobs_path(company)
    click_on('Developer')
    click_on('Update This Job')

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job_1.id}/edit")
    expect(page).to have_content('')
  end

  it "by clicking on edit" do
    company = Company.create(id: 1, name: "Foo")
    category = Category.create(id: 1, title: "Bar")
    job = company.jobs.create(id: 1, title: "Baz", level_of_interest: 75, city: "New Qux City", category_id: category.id)

    visit edit_company_job_path(company, job)

    fill_in "job[title]",	with: "Hot Topic!"
    click_on "Update Job"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content("Hot Topic!")
    expect(page).to_not have_content("Baz")
  end
end
