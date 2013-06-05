require 'spec_helper'

describe Prop do
  let(:valid_prop) { FactoryGirl.build(:prop) }
  let(:valid_prop2) { valid_prop.dup }
  subject { valid_prop }

  it { should be_valid }

  it "isn't valid without a user" do
    valid_prop.user = nil
    expect(valid_prop).to_not be_valid
  end

  it "isn't valid without an app" do
    valid_prop.app = nil
    expect(valid_prop).to_not be_valid
  end

  it "only gives one prop per app per user" do
    valid_prop.save
    valid_prop2.save
    expect(valid_prop2.errors.messages).to include(:app_id=>["has already been taken"])
  end
end
