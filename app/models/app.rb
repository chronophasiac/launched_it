# == Schema Information
#
# Table name: apps
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  name          :string(255)      not null
#  url           :string(255)      not null
#  codebase_url  :string(255)      not null
#  description   :text             not null
#  email_visible :boolean          default(FALSE), not null
#  user_id       :integer          not null
#

class App < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :url
  validates_presence_of :codebase_url
  validates_presence_of :user_id
  validates_presence_of :user

  belongs_to  :user,
              inverse_of: :apps

  has_many :comments, {
          dependent: :destroy,
          inverse_of: :app
  }

  has_many :props, {
          dependent: :destroy,
          inverse_of: :app
  }

  validates :codebase_url, url: true
  validates :url, url: true

  attr_accessible :name, :description, :url, :codebase_url, :email_visible
end
