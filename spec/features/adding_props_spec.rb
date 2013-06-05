require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature %Q{As a user
I want to 'give props' for an application
So that I can applaud the efforts of its author}, "adding props" do

  given(:user) { FactoryGirl.create(:user) }
  given(:app) { FactoryGirl.create(:app) }
  background do
    login_as(user, scope: :user)
    visit app_path(app.id)
  end

  scenario "no props yet" do
    expect(page).to have_content("1 prop")
    click_link("Props")
    expect(page).to have_content("2 props")
  end

  scenario "a user has already given ze props" do
    click_link("Props")
    expect(page).to have_content("2 props")
    click_link("Props")
    expect(page).to have_content("1 prop")
  end
end
