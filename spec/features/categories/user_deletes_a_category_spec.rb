require 'rails_helper'

describe "user wants to delete category" do
  describe "user clicks on delete" do
    it "deletes the category" do
      category = Category.create(title: 'Foo')

      visit categories_path

      find(:css, ".delete-category-link").click


      expect(page).to_not have_content(category)
    end
  end
end
