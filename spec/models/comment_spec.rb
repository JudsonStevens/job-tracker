require 'rails_helper'

describe Comment do
  describe 'validations' do
    describe 'invalid attributes' do
      it 'is invalid without content' do
        comment = Comment.new()

        expect(comment).to be_invalid
      end
    end

    describe 'valid attributes' do
      it 'is valid with content' do
        company = Company.create(name: "ESPN")
        category = Category.create(title: 'Web')
        job = company.jobs.create(title: "Developer", description: 'Great job', level_of_interest: 70, category_id: category.id, city: "Denver")
        comment = job.comments.create(content: "I can't belive you've done this")

        expect(comment).to be_valid
      end
    end
  end
end