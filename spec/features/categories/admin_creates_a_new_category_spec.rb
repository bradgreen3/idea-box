require 'rails_helper'

describe "user visits new category path" do
  context "as an admin" do
    it "creates a new category" do

      visit new_admin_category_path
      fill_in "category[name]", with: "Category 1"
      click_on "Create Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Category 1")
    end
  end
end
