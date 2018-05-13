require 'rails_helper'

describe 'User creates a new category' do
  scenario 'by filling in the fields and clicking submit' do
    visit(new_category_path)

    fill_in('category[title]', with: 'Web Designer')

    click_button('Create Category')

    expect(current_path).to eq("/categories/#{Category.all.first.id}")
    expect(page).to have_content('Web Designer')
  end
end