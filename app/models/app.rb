class App < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :url
  validates_presence_of :codebase_url
  attr_accessible :name, :description, :url, :codebase_url, :email_visible
end
