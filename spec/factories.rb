FactoryGirl.define do

  factory :user do
    sequence(:email)      { |n| "email#{n}@launchedit.com" }
    password              "foobar123"
    password_confirmation "foobar123"
    first_name            "timmy"
    last_name             "tables"
  end

  factory :app do
    user
    name          "test app"
    url           "http://testapp.com"
    codebase_url  "http://github.com/testapp"
    description   "testing the description"
    email_visible true
  end

  factory :comment do
    body "This is an amazing app. I ahve nevar seen such an app in my life.
    I swear. By the moon and the stars in the sky. I'll be there."
    user
    app
  end

  factory :prop do
    app
    user
  end

end
