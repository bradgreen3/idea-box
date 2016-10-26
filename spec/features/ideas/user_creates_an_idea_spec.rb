require 'rails_helper'

describe "user creates an idea" do
  scenario "user creates an idea and is redirected to its show page" do

    visit new_idea_path
    fill_in "idea[idea]", with: "My first amazing idea"
    click_on "Create Idea"

    expect(current_path).to eq(idea_path(Idea.last.id))
    expect(page).to have_content("My first amazing idea")
  end
end
