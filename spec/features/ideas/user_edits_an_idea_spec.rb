require 'rails_helper'

describe "user edits an idea" do
  scenario "user edits an idea" do

    idea = Idea.create(idea: "Smart cars")
    idea2 = Idea.create(idea: "Square bowling balls")

    visit ideas_path
    within(".idea_#{idea.id}") do
      click_link "Edit"
    end

    expect(current_path).to eq edit_idea_path(idea.id)
    fill_in "idea_idea", with: "Self-driving cars"
    click_button "Update"
    expect(current_path).to eq idea_path(idea)
    expect(page).to have_content("Self-driving cars")
  end
end
