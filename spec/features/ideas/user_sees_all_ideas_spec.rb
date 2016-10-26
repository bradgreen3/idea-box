require 'rails_helper'

describe "a user sees all ideas" do
  scenario "a user sees all ideas" do

  idea1 = Idea.create(idea: "Pickle-flavored toothpaste")
  idea2 = Idea.create(idea: "Carboard shoe company")

  visit ideas_path
  expect(page).to have_link("Idea ##{idea1.id}")
  expect(page).to have_link("Idea ##{idea2.id}")
  end
end
