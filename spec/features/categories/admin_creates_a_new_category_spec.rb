require 'rails_helper'

describe 'User visits the admin categories page' do
  context 'as an admin' do
    it 'they see Admin Categories' do
      admin = User.create(name: "Brad",
                          email: "brad@yahoo.com",
                          password: "pass",
                          password_confirmation: "pass",
                          role: 1
                         )
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path
      fill_in "category[name]", with: "Category 1"
      click_on "Create Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Category 1")
    end
  end

  context 'as a default user' do
    it 'they are shown a 404' do
      user = User.create(name: "Sal",
                         email: "sal@sal.com",
                         password: "pass",
                         password_confirmation: "pass"
                        )

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit new_admin_category_path
      expect(page).to_not have_content("Create Category")
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
