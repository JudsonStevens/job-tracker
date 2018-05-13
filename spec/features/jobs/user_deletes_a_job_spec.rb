require 'rails_helper'

describe "user deletes a job" do
  describe "they link from the show page" do
    it "displays all jobs without the deleted entry" do
      company = Company.create!(name: "ESPN")
      category = Category.create!(title: 'Web')
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)

      visit company_job_path(company, job)

      click_link "Delete"

      expect(current_path).to eq(company_jobs_path(company))
      expect(page).to have_content("#{job.title} was successfully deleted")
    end
  end
end
