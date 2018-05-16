require 'rails_helper'

describe 'User' do
  describe 'can see all valid information on the dashboard' do
    it 'and the user can see the top three companies ranked by level of interest' do
      company = Company.create(name: "ESPN")
      company_2 = Company.create(name: 'Starbucks')
      company_3 = Company.create(name: 'Turing')
      company_4 = Company.create(name: 'G School')
      category = Category.create(title: 'Web')
      job_1 = company.jobs.create(title: "Developer", level_of_interest: 10, city: "Denver", category_id: category.id)
      job_2 = company_2.jobs.create(title: "QA Analyst", level_of_interest: 50, city: "New York City", category_id: category.id)
      job_3 = company_2.jobs.create(title: "Web Developer", level_of_interest: 40, city: "Baton Rouge", category_id: category.id)
      job_4 = company_2.jobs.create(title: "Manager", level_of_interest: 30, city: "Denver", category_id: category.id)
      job_5 = company_3.jobs.create(title: "HR", level_of_interest: 20, city: "New York City", category_id: category.id)
      job_6 = company_3.jobs.create(title: "HR", level_of_interest: 80, city: "New York City", category_id: category.id)

      visit(dashboard_path)

      expect(page).to have_content(company.name)
      expect(page).to have_content(company_2.name)
      expect(page).to have_content(company_3.name)
      expect(page).to_not have_content(company_4.name)
    end

    it 'and the user can see the jobs count by city' do
      company = Company.create(name: "ESPN")
      company_2 = Company.create(name: 'Starbucks')
      company_3 = Company.create(name: 'Turing')
      company_4 = Company.create(name: 'G School')
      category = Category.create(title: 'Web')
      job_1 = company.jobs.create(title: "Developer", level_of_interest: 10, city: "Denver", category_id: category.id)
      job_2 = company_2.jobs.create(title: "QA Analyst", level_of_interest: 50, city: "New York City", category_id: category.id)
      job_3 = company_2.jobs.create(title: "Web Developer", level_of_interest: 40, city: "Baton Rouge", category_id: category.id)
      job_4 = company_2.jobs.create(title: "Manager", level_of_interest: 30, city: "Denver", category_id: category.id)
      job_5 = company_3.jobs.create(title: "HR", level_of_interest: 20, city: "New York City", category_id: category.id)
      job_6 = company_3.jobs.create(title: "HR", level_of_interest: 80, city: "New York City", category_id: category.id)

      visit(dashboard_path)

      expect(page).to have_content("#{job_3.city} jobs (1 job(s))")
      expect(page).to have_content("#{job_5.city} jobs (3 jobs(s))")
      expect(page).to have_content("#{job_1.city} jobs (2 jobs(s))")
    end
  end

  describe 'can click on a city to go to jobs index for that city' do
    it 'takes the user to the index page for that city that shows all of the jobs' do
      company = Company.create(name: "ESPN")
      company_2 = Company.create(name: 'Starbucks')
      company_3 = Company.create(name: 'Turing')
      company_4 = Company.create(name: 'G School')
      category = Category.create(title: 'Web')
      job_1 = company.jobs.create(title: "Developer", level_of_interest: 10, city: "Denver", category_id: category.id)
      job_2 = company_2.jobs.create(title: "QA Analyst", level_of_interest: 50, city: "New York City", category_id: category.id)
      job_3 = company_2.jobs.create(title: "Web Developer", level_of_interest: 40, city: "Baton Rouge", category_id: category.id)
      job_4 = company_2.jobs.create(title: "Manager", level_of_interest: 30, city: "Denver", category_id: category.id)
      job_5 = company_3.jobs.create(title: "HR", level_of_interest: 20, city: "New York City", category_id: category.id)
      job_6 = company_3.jobs.create(title: "HR", level_of_interest: 80, city: "New York City", category_id: category.id)

      visit(dashboard_path)
      click_on(job_1.city)

      expect(current_path).to eq("/jobs?sort=#{job_1.city}")
      expect(page).to have_content(job_1.city)
      expect(page).to have_content(job_1.category_id)
      expect(page).to have_content(job_1.title)
      expect(page).to have_content(job_1.level_of_interest)
      expect(page).to_not have_content(job_6.city)
      expect(page).to_not have_content(job_6.level_of_interest)
      expect(page).to_not have_content(job_6.title)
    end
  end
end
