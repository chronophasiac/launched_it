class Prop < ActiveRecord::Base
  attr_accessible :app_id, :user_id
  validates :app, :user, presence: true
  validates_uniqueness_of :app_id, scope: :user_id
  belongs_to :app
  belongs_to :user
end
