FactoryGirl.define do

  factory :user do
    sequence(:email)      {|n| "email#{n}@launchedit.com" }
    password              "foobar123"
    password_confirmation "foobar123"
  end

  factory :app do
    name          "test app"
    url           "http://testapp.com"
    codebase_url  "http://github.com/testapp"
    description   "testing the description"
    email_visible true
  end

end
