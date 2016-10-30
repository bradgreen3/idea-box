require 'rails_helper'

describe "a user sees all ideas" do
  scenario "a user sees all ideas" do

  user = User.create(name: "Brad", email: "brad@yahoo.com", password: "pass")
  idea1 = user.ideas.create(idea: "Pickle-flavored toothpaste")
  idea2 = user.ideas.create(idea: "Carboard shoe company")

  page.set_rack_session(user_id: user.id)

  visit user_ideas_path(user)
  expect(page).to have_link("Idea ##{idea1.id}")
  expect(page).to have_link("Idea ##{idea2.id}")
  end
end
