require 'rails_helper'

describe "user creates an idea" do
  scenario "user creates an idea and is redirected to its show page" do

    user = User.create(name: "Brad", email: "brad@yahoo.com", password: "pass")

    page.set_rack_session(user_id: user.id)

    visit new_user_idea_path(user)
    fill_in "idea[idea]", with: "My first amazing idea"
    click_on "Create Idea"

    expect(current_path).to eq(user_idea_path(user, user.ideas.last))
    expect(page).to have_content("My first amazing idea")
  end
end
