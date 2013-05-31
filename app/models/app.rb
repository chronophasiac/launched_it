class App < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :url
  validates_presence_of :codebase_url
  validates_presence_of :user_id
  validates_presence_of :user

  belongs_to  :user,
              inverse_of: :apps

  validates :codebase_url, url: true
  validates :url, url: true

  attr_accessible :name, :description, :url, :codebase_url, :email_visible
end
