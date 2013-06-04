# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  user_id    :integer          not null
#  app_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :user, {
    inverse_of: :comments
  }
  belongs_to :app, {
    inverse_of: :comments
  }

  validates :user_id, :app_id, :user, :app, :body, presence: true
end
