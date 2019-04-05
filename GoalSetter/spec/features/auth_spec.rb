require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit "/users/new"
  end


  feature 'signing up a user' do
    scenario "with invalid params" do
      fill_in "Username:" with ""
      fill_in "Password:" with "asdf"
      click_on "Sign up!"
      expect(current_path).to eq("/users/new")
      expect(page).to have_content("Invalid signup Info")
    end

    scenario 'with valid params' do
      fill_in "Username:" with "Anthony"
      fill_in "Password:" with "hunter12"
      click_on "Sign up!"
      save_and_open_page
      expect(page).to have_content("Anthony")
    end


  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    expect(page).to have_content("Welcome, #{User.find_by(username: 'Anthony')}")
  end
end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    click_on "Log Out"
    expect(current_path).to eq("/users/new")
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    expect(current_path).to eq("/users/new")
    expect(page).not_to have_content("Anthony")
  end

end