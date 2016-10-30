require 'rails_helper'

describe "user visits category index page" do
  context "as an admin" do
    it "deletes a category" do
      admin = User.create(name: "Brad",
                          email: "brad@yahoo.com",
                          password: "pass",
                          password_confirmation: "pass",
                          role: 1
                         )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      cat1 = Category.create(name: "Category 1")
      cat2 = Category.create(name: "Category 2")

      visit admin_categories_path
      within(".category_#{cat1.id}") do
        click_on "Delete"
      end

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Category 1 was successfully deleted!")
      expect(page).to have_content("Category 2")
    end
  end
end
