class Comment < ActiveRecord::Base
  attr_accessible :body, :email, :first_name, :last_name, :user_id, :app_id
  validates :body, :first_name, :last_name, :user_id, :app_id, presence: true
  belongs_to :user, inverse_of: :comments
  belongs_to :app, inverse_of: :comments
end
