require 'rails_helper'

describe "user deletes an idea" do
  scenario "user deletes an idea" do

    category = Category.create(name: "Category 1")
    user = User.create(name: "Brad", email: "brad@yahoo.com", password: "pass")
    idea1 = user.ideas.create(idea: "Chia pet wigs", category_id: category.id)
    idea2 = user.ideas.create(idea: "Breakfast for dinner", category_id: category.id)

    page.set_rack_session(user_id: user.id)

    visit user_ideas_path(user)

    within(".idea_#{idea1.id}") do
      click_link "Delete"
    end

    expect(current_path).to eq(user_ideas_path(user))
    expect(page).to_not have_content "Chia pet wigs"
  end
end
