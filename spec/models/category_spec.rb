require 'rails_helper'

describe Category do
  describe 'Validations' do
    it 'is invalid without a title' do
      category = Category.new()

      expect(category).to be_invalid
    end

    it 'is invalid if the title is the same as another title of a category' do
      Category.create(title: 'Web')
      category = Category.new(title: 'Web')

      expect(category).to be_invalid
    end

    it 'is valid with a title' do
      category = Category.new(title: 'Web')

      expect(category).to be_valid
    end
  end

  describe 'Relationships' do
    it 'has many jobs' do
      category = Category.new(title: 'Web')

      expect(category).to respond_to(:jobs)
    end
  end
end
