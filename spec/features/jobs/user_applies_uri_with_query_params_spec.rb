require 'rails_helper'

describe "User enters the sort=interst query string in jobs URI" do
  describe "and sees a list of jobs" do
    it "sorted by level of interest" do
      company_1 = Company.create(name: "Foo")
      company_2 = Company.create(name: "Bar")
      company_3 = Company.create(name: "Baz")
      cat_1 = Category.create(title: "Dev")
      cat_2 = Category.create(title: "QA")
      job_1 = company_1.jobs.create(title: "Foobar", description: "qwerty", level_of_interest: 50, city: "lorem", category_id: cat_1.id)
      job_2 = company_2.jobs.create(title: "Barbaz", description: "asdf", level_of_interest: 60, city: "ipsum", category_id: cat_1.id)
      job_3 = company_3.jobs.create(title: "Bazfoo", description: "zxcvb", level_of_interest: 70, city: "loreminem", category_id: cat_1.id)
      job_4 = company_2.jobs.create(title: "Foobaz", description: "uiop", level_of_interest: 80, city: "degoba", category_id: cat_2.id)
      job_5 = company_3.jobs.create(title: "Bazbar", description: "zxcvbn", level_of_interest: 90, city: "Hoth", category_id: cat_2.id)
      jobs = Job.all

      visit '/jobs?sort=interest'

      expect(page).to have_content(jobs.first.title)
      expect(page).to have_content(jobs.last.title)
    end
  end
end
