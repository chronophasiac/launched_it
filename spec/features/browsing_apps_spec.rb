require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature %Q{As a user
      I want to browse the list of applications
      So that I can see what they're about}, "browsing apps" do

  given(:user) { FactoryGirl.create(:user) }
  given(:app1) { FactoryGirl.create(:app, name: "First app") }
  given(:app2) { FactoryGirl.create(:app, name: "Second app") }
  given(:app3) { FactoryGirl.create(:app, name: "Third app") }
  background do 
    login_as(user, scope: :user)
    visit apps_path
  end
  
  # I can view a list of all applications that have been submitted
  scenario "there is a list of apps" do
    expect(page).to have_content("First app")
  end

end
