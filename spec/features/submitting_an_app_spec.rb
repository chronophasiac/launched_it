require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature %Q{As a user
        I want to submit my app
        So that I can showcase it}, "submitting an app" do

  given(:user) { FactoryGirl.create(:user) }
  background do 
    login_as(user, scope: :user)
    visit new_app_path
    fill_in "Application Name", with: "this is an app name"
    fill_in "app_url", with: "http://appname.com"
    fill_in "app_codebase_url", with: "http://github.com/appname"
    fill_in "Description", with: "This app is the awesomest"
  end

  scenario "with all fields filled in" do
    initial_app_count = App.count
    click_button "Create App"
    expect(App.count).to eql(initial_app_count + 1)
    expect(page).to have_content("App was successfully created")
  end

  # I must specify my application name, url, codebase url and a description.
  scenario "with name omitted" do
    initial_app_count = App.count
    fill_in "Application Name", with: ""
    click_button "Create App"
    expect(App.count).to eql(initial_app_count)
    expect(page).to have_content("can't be blank")
  end

  # I must specify a valid url
  scenario "with an invalid URL" do
    initial_app_count = App.count
    visit new_app_path
    fill_in "app_url", with: "invalidurl"
    click_button "Create App"
    expect(App.count).to eql(initial_app_count)
    expect(page).to have_content("is not a valid URL")
  end

  # I must specify a valid codebase url
  scenario "with an invalid codebase URL" do
    initial_app_count = App.count
    fill_in "app_codebase_url", with: "invalidurl"
    click_button "Create App"
    expect(App.count).to eql(initial_app_count)
    expect(page).to have_content("is not a valid URL")
  end

  # I can optionally specify a contact email address for an application
  # If I specify a contact email address, it should validate that the address is a valid email address
  scenario "with my email visible" do
    initial_app_count = App.count
    check "Display my email on the app page"
    click_button "Create App"
    expect(App.count).to eql(initial_app_count + 1)
    expect(page).to have_content("App was successfully created")
    expect(App.last.user.email).to eql(user.email)
  end
end

# feature "Submitting an app" do

#   scenario "while not signed in" do
#     visit new_app_path
#     expect(page).to have_content("You need to sign in or sign up before continuing")
#   end

# end
