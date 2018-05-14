require 'rails_helper'

describe "user visits categories index," do
  before :each do
    @category_1 = Category.create(title: "Foo")
    @category_2 = Category.create(title: "Bar")
    @category_3 = Category.create(title: "Baz")
    @category_4 = Category.create(title: "Qux")
  end
  it "a user sees all categories" do
    visit categories_path

    expect(page).to have_link(@category_1.title)
    expect(page).to have_link(@category_2.title)
    expect(page).to have_link(@category_3.title)
    expect(page).to have_link(@category_4.title)
  end

  it "a user clicks on a category to navigate to individual category page" do
    visit categories_path

    click_link @category_1.title

    expect(current_path).to eq(category_path(@category_1))
  end

  scenario "a user can edit a category" do
    # category = Category.create(title: "Foo")

    visit categories_path
    click_link "Edit"

    fill_in "category[title]",	with: "Foobarbaz"

    click_button "Update Category"

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Foobarbaz")
    expect(page).to_not have_content(category)
  end
end
