require 'rails_helper'

describe "a user sees a specific idea" do
  scenario "a user sees specific idea" do

  idea1 = Idea.create(idea: "Pickle-flavored toothpaste")
  idea2 = Idea.create(idea: "Carboard shoe company")

  visit ideas_path
  click_link("Idea ##{idea1.id}")

  expect(current_path).to eq(idea_path(idea1.id))
  expect(page).to have_content("Pickle-flavored toothpaste")
  end
end
