require 'rails_helper'

describe "user deletes an idea" do
  scenario "user deletes an idea" do

    idea1 = Idea.create(idea: "Chia pet wigs")
    idea2 = Idea.create(idea: "Breakfast for dinner")

    visit ideas_path

    within(".idea_#{idea1.id}") do
      click_link "Delete"
    end

    expect(current_path).to eq(ideas_path)
    expect(page).to_not have_content "Chia pet wigs"
  end
end
