require 'rails_helper'

describe "user visits login page" do
  scenario "they can log in" do
    user = User.create(name: "Brad", email: "brad@yahoo.com", password: "pass")

    visit login_path
    within("form") do
      fill_in "email", with: user.email
      fill_in "password", with: user.password
      click_on "Login"
    end

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Successfully logged in!")
    expect(page).to have_content("Welcome, Brad!")
    expect(page).to have_content("Logout")
  end
end
