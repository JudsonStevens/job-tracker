require 'rails_helper'

describe "user deletes a job" do
  describe "clicks on job then clicks on delete link from the job show page" do
    it "and redirects to company show page without deleted entry" do
      company = Company.create(name: "ESPN")
      category = Category.create(title: 'Web')
      job = company.jobs.create(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job.comments.create(content: "hello")

      visit company_job_path(company, job)

      click_link "Delete"

      expect(current_path).to eq(company_jobs_path(company))
      expect(page).to have_content("#{job.title} was successfully deleted")
      expect(page).to_not have_content("#{job.title} at #{company.name}") 
    end    
  end
end
