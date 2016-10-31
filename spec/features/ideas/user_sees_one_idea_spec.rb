require 'rails_helper'
require 'spec_helper'


describe "a user sees a specific idea" do
  scenario "a user sees specific idea" do

  category = Category.create(name: "Category 1")
  user = User.create(name: "Brad", email: "brad@yahoo.com", password: "pass")
  idea1 = user.ideas.create(idea: "Pickle-flavored toothpaste", category_id: category.id)
  idea2 = user.ideas.create(idea: "Carboard shoe company", category_id: category.id)

  page.set_rack_session(user_id: user.id)

  visit user_ideas_path(user)
  click_link("Idea ##{idea1.id}")

  expect(current_path).to eq(user_idea_path(user, idea1))
  expect(page).to have_content("Pickle-flavored toothpaste")
  end
end
