require 'rails_helper'
require 'spec_helper'


describe "a user sees a specific idea" do
  scenario "a user sees specific idea" do

  user = User.create(name: "Brad", email: "brad@yahoo.com", password: "pass")
  idea1 = user.ideas.create(idea: "Pickle-flavored toothpaste")
  idea2 = user.ideas.create(idea: "Carboard shoe company")

  page.set_rack_session(user_id: user.id)
  
  visit user_ideas_path(user)
  click_link("Idea ##{idea1.id}")

  expect(current_path).to eq(user_idea_path(user, idea1))
  expect(page).to have_content("Pickle-flavored toothpaste")
  end
end
