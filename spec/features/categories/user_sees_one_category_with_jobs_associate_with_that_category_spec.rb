require 'rails_helper'

describe "User visits a category page," do
  it "user sees a list of jobs associated with that category" do
    category = Category.create(title: 'Foo')
    job = Job.create(title: 'Dev', level_of_interest: 80, city: 'Denver', category_id: category.id)

    visit category_path("category/#{category.id}")

    expect(page).to have_content("Foo")
    expect(page).to have_content("Dev")
    expect(page).to have_content("Denver")
  end
end
