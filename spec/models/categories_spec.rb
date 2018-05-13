require 'rails_helper'

describe Category do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        category = Category.new

        expect(category).to be_invalid
      end
      it "has a unique title" do
        Category.create(title: "Foo")
        category = Category.new(title: "Foo")

        expect(category).to be_invalid
      end

    context "valid attibutes" do
      it "is valid with a title" do
        category = Category.new(title: "Foo")

        expect(category).to be_valid
      end
    end

  describe "relationships" do
    it { should have_many(:jobs) }
    end
  end
end
