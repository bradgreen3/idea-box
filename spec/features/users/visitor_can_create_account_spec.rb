require 'rails_helper'

describe "user visits a new user page" do
  scenario "they can create a new user" do

    visit new_user_path
    fill_in "user[name]", with: "Brad"
    fill_in "user[email]", with: "brad@yahoo.com"
    fill_in "user[password]", with: "pass"
    fill_in "user[password_confirmation]", with: "pass"
    click_on "Create User"

    expect(current_path).to eq(user_path(User.last))
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome, Brad!")

  end
end
