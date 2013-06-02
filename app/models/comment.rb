# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  first_name :string(255)      not null
#  last_name  :string(255)      not null
#  email      :string(255)
#  body       :text             not null
#  user_id    :integer          not null
#  app_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :body, :email, :first_name, :last_name, :user_id, :app_id
  validates :body, :first_name, :last_name, :user_id, :app_id, presence: true
  belongs_to :user, inverse_of: :comments
  belongs_to :app, inverse_of: :comments
end
