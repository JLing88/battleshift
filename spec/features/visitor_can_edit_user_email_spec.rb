require 'rails_helper'

feature 'visitor can edit email' do
  scenario 'edits email' do
# When I visit "/users"
  visit "/users"

# And I click on `Edit` for Josiah Bartlet
  within "#user-1" do
    click_on "Edit"
  end 

  # Then I should be on "/users/1/edit"
  expect(current_path).to eq("/users/1/edit")


  # When I fill in the email field with "josiah@example.com"
  fill_in :email, with: "josiah@example.com"

  # And I click "Save"
  click_on "Save"

  # Then I should be on "/users"
  expect(current_path).to eq("/users")

  # And I should see a flash message that says "Successfully updated Josiah Bartlet."
  expect(page).to have_content("Successfully updated Josiah Bartlet.")

  # And I should should see Josiah Bartlet's email show up in the list as "josiah@example.com"

  expect(page).to have_content("josiah@example.com")

  end
end
