require 'rails_helper'

describe "user edits an idea" do
  scenario "user edits an idea" do

    category = Category.create(name: "Category 1")
    user = User.create(name: "Brad", email: "brad@yahoo.com", password: "pass")
    idea = user.ideas.create(idea: "Smart cars", category_id: category.id)
    idea2 = user.ideas.create(idea: "Square bowling balls", category_id: category.id)

    page.set_rack_session(user_id: user.id)

    visit user_ideas_path(user)
    within(".idea_#{idea.id}") do
      click_link "Edit"
    end

    expect(current_path).to eq edit_user_idea_path(user, idea.id)
    fill_in "idea_idea", with: "Self-driving cars"
    click_button "Update"
    expect(current_path).to eq user_idea_path(user, idea)
    expect(page).to have_content("Self-driving cars")
  end
end
