require 'rails_helper'
# Title: Dogfooding GET /api/v1/users/:id
#
# Background: There is a user stored in the database with an id of 1,
# name of Josiah Bartlet, email of jbartlet@example.com
#
# As a guest user
# When I visit "/users/1"

feature 'visitor goes to a user show page' do
  scenario 'they see the user name and email address' do

    visit "/users/1"

    expect(page).to have_content("Josiah Bartlett")
    # Then I should see the user's name Josiah Bartlet
    expect(page).to have_content("jbartlet@example.com")
    # And I should see the user's email address jbartlet@example.com
  end
end
