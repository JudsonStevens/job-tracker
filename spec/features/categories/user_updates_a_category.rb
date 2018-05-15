require 'rails_helper'

describe "User updates a category from index page" do
  describe "user clicks on edit" do
    category = Category.create(title: "Cold Topic")
    visit edit_category_path(category)

    fill_in "category[title]",	with: "Hot Topic!"
    click_button "Update"

    expect(current_path).to eq(category_path)
    expect(page).to have_content("Hot Topic!")
    expect(page).to_not have_content("Cold Topic")
  end
  
end
