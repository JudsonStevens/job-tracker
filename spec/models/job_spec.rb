require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Denver", company_id: 2, category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Denver", company_id: 2, category_id: 1)
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end

      it 'is invalid without a category' do
        job = Job.new(title: 'Developer', level_of_interest: 80, description: "Wahoo", city: "Denver", company_id: 2)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.create!(name: "Turing")
        category = Category.create!(title: 'Web')
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver", company_id: company.id, category_id: category.id)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", company_id: 2, category_id: 1)
      expect(job).to respond_to(:company)
    end

    it 'belongs to a category' do
      job = Job.new(title: "Software", level_of_interest: 70, description: "Wahooo", company_id: 2, category_id: 1)

      expect(job).to respond_to(:category)
    end
  end

  describe "class methods," do
    describe "#by_category" do
      it "returns jobs by category" do
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

        expect(Job.all.size).to eq(5)
        expect(Job.by_category(cat_1.id).size).to eq(3)
        expect(Job.by_category(cat_1.id).first).to eq(job_1)
        expect(Job.by_category(cat_2.id).last).to eq(job_5)
      end
    end

    describe "#sort_by_interest" do
      it "returns jobs sorted by interest" do
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

        expect(jobs.size).to eq(5)
        expect(jobs.sort_by_interest.first).to eq(job_5)
        expect(jobs.all.sort_by_interest.last).to eq(job_1) 
      end
    end

    describe "The count_by_level_of_interest method" do
      it "returns a count of jobs by level of interest" do
        company_1 = Company.create(name: "Foo")
        company_2 = Company.create(name: "Bar")
        company_3 = Company.create(name: "Baz")
        cat_1 = Category.create(title: "Dev")
        cat_2 = Category.create(title: "QA")
        job_1 = company_1.jobs.create(title: "Foobar", description: "qwerty", level_of_interest: 50, city: "lorem", category_id: cat_1.id)
        job_2 = company_2.jobs.create(title: "Barbaz", description: "asdf", level_of_interest: 50, city: "ipsum", category_id: cat_1.id)
        job_3 = company_3.jobs.create(title: "Bazfoo", description: "zxcvb", level_of_interest: 80, city: "loreminem", category_id: cat_1.id)
        job_4 = company_2.jobs.create(title: "Foobaz", description: "uiop", level_of_interest: 80, city: "degoba", category_id: cat_2.id)
        job_5 = company_3.jobs.create(title: "Bazbar", description: "zxcvbn", level_of_interest: 90, city: "Hoth", category_id: cat_2.id)
        jobs = Job.all


      expect(jobs.size).to eq(5)
      expect(jobs.count_by_level_of_interest[0][1]).to eq(1)
      expect(jobs.count_by_level_of_interest[1][1]).to eq(2)
      expect(jobs.count_by_level_of_interest[2][1]).to eq(2)
      end
    end
  end
end
