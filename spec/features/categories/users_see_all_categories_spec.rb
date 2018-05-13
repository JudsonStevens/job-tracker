require 'rails_helper'

describe "user visits categories index" do
  scenario "a user sees all categories" do
    category_1 = Category.create(title: "Foo")
    category_2 = Category.create(title: "Bar")
    category_3 = Category.create(title: "Baz")
    category_4 = Category.create(title: "Qux")

    visit categories_path

    expect(page).to have_content(category_1)
    expect(page).to have_content(category_2)
    expect(page).to have_content(category_3)
    expect(page).to have_content(category_4)
  end

  scenario "a user clicks on a category to navigate to individual category page" do
    category = Category.create(title: "Foo")

    visit categories_path

    click_link "Foo"

    expect(current_path).to eq(category_path(category))
  end

  scenario "a user can edit a category" do
    category = Category.new(title: "Foo")

    visit categories_path

    click_button "Edit"

    fill_in "category[title]",	with: "Foobarbaz"

    click_button "Submit"

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("Foobarbaz")
    expect(page).to_not have_content(category)
  end
end
