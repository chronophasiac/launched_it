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

require 'spec_helper'

describe Comment do
  let(:valid_comment) { FactoryGirl.build(:comment) }
  let(:invalid_comment) { valid_comment.dup }

  it "is valid" do
    expect(valid_comment).to be_valid
  end

  it "is not valid if it does not have a user" do
    invalid_comment.user = nil
    expect(invalid_comment).to_not be_valid
  end

  it "is not valid if it does not have an app" do
    invalid_comment.app = nil
    expect(invalid_comment).to_not be_valid
  end

  it "is not valid if it does not have a body" do
    invalid_comment.body = nil
    expect(invalid_comment).to_not be_valid
  end
end
