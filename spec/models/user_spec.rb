require 'spec_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }

  it "is not valid without a first name" do
    invalid_user = user.dup
    invalid_user.first_name = ""
    expect(invalid_user).to_not be_valid
  end

  it "is not valid without a last name" do
    invalid_user = user.dup
    invalid_user.last_name = ""
    expect(invalid_user).to_not be_valid
  end

  it "returns a full name" do
    expected_name = "#{user.first_name} #{user.last_name}"
    expect(user.full_name).to eql(expected_name)
  end

end
