require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature %Q{As a user
      I want to browse the list of applications
      So that I can see what they're about}, "browsing apps" do

  given(:user) { FactoryGirl.create(:user) }
  background do 
    login_as(user, scope: :user)
    FactoryGirl.create(:app, name: "First app")
    FactoryGirl.create(:app, name: "Second app", user: user)
    visit apps_path
  end

  # I can view a list of all applications that have been submitted
  scenario "there is a list of apps" do
    expect(page).to have_content("First app")
    expect(page).to have_content("Second app")
  end

  # I can view an individual application that has been submitted.
  scenario "each app has a link to show the description" do
    first('.app-row').click_link "Show"
    expect(page).to have_content("testing the description")
  end

  # It should show all of the attributes a user can specify when sharing their application.
  scenario "each app has a link to show the user's email if they've chosen to display it" do
    first('.app-row').click_link "Show"
    expect(page).to have_content("@launchedit.com")
  end

  # If I navigate to a URL where the application id does not exist,
  # I should receive an "Application Not Found" error, and I should be redirected to the app listing
  scenario "when navigating to an invalid application, I should receive an error message" do
    visit '/apps/9000'
    expect(page).to have_content("Application Not Found")
  end

  # I should receive an "Application Not Found" error, and I should be redirected to the app listing
  scenario "when navigating to an invalid application, I should be redirected to the app listing" do
    visit '/apps/9000'
    expect(current_path).to eql(apps_path)
  end

end
