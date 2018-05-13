require 'rails_helper'

describe "user deletes a job" do
  describe "they link from the show page" do
    it "displays all jobs without the deleted entry" do
      company = Company.create!(name: "ESPN")
      job_1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      job_2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")

      visit company_job_path(company, job_1)
      click_link "Delete"

      expect(page).to have_content(job_2.title)
      expect(page).to_not have_content(job_1.title)
    end
  end
end
