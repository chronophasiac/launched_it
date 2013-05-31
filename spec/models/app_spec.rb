require 'spec_helper'

describe App do
  let(:app) { FactoryGirl.build(:app) }

  it "is valid with all required attributes" do
    expect(app).to be_valid
  end
end
