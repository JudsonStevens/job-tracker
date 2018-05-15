require 'rails_helper'

describe "users click edit on the index page" do
  it "a user can edit a category" do
    category = Category.create(title: "Foo")

    visit categories_path
    click_link "Edit"

    fill_in "category[title]",	with: "Foobarbaz"

    click_button "Update Category"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Foobarbaz")
    expect(page).to_not have_content(category)
  end
end
