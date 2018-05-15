require 'rails_helper'

describe "user visits categories index," do
    category = Category.create(title: "Foo")

    it "a user sees all categories" do
      visit categories_path

      expect(page).to have_link(category.title)
  end

  it "a user clicks on a category to navigate to individual category page" do
    category = Category.create(title: "Foo")

    visit categories_path

    click_link category.title

    expect(page).to have_content(category.title)
  end
end
