require 'rails_helper'

describe "user creates an idea" do
  scenario "user creates an idea and assigns it a category" do

    cat1 = Category.create(name: "Category 1")
    cat2 = Category.create(name: "Category 2")

    user = User.create(name: "Brad", email: "brad@yahoo.com", password: "pass")
    page.set_rack_session(user_id: user.id)

    visit new_user_idea_path(user)
    fill_in "idea[idea]", with: "My first amazing idea"
    select "Category 1", :from => "idea[category_id]"
    click_on "Create Idea"

    expect(current_path).to eq(user_idea_path(user, user.ideas.last))
    expect(page).to have_content("My first amazing idea")
    expect(page).to have_content("Category 1")
  end
end
