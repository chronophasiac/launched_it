require 'spec_helper'
include Warden::Test::Helpers

Warden.test_mode!

feature %Q{As a user
I want to comment on an app
So that I can discuss it}, "adding a comment" do

  given(:user) { FactoryGirl.create(:user) }
  background do 
    login_as(user, scope: :user)
    app1 = FactoryGirl.create(:app, name: "First app")
    app2 = FactoryGirl.create(:app, name: "Second app", user: user)
    visit apps_path
    first('.app-row').click_link app1.name
    click_link("Comment")
    fill_in("Body", with: "test comment")
    click_button("Create Comment")
  end

  # I must specify a comment for it to persist
  scenario "Posting a comment" do
    expect(page).to have_content("test comment")
  end

  # I must also specify my first name, last name, and email address as part of the comment
  scenario "Comment has first name, last name, and email" do
    expect(page).to have_content(user.email)
    expect(page).to have_content(user.full_name)
  end

end
