require 'spec_helper'

describe App do
  let(:app) { FactoryGirl.build(:app) }

  it "is valid with all required attributes" do
    expect(app).to be_valid
  end

  it "is not valid without a name" do
    invalid_app = app.dup
    invalid_app.name = ""
    expect(invalid_app).to_not be_valid
  end

  it "is not valid without a description" do
    invalid_app = app.dup
    invalid_app.description = ""
    expect(invalid_app).to_not be_valid
  end

  it "is not valid without a URL" do
    invalid_app = app.dup
    invalid_app.url = ""
    expect(invalid_app).to_not be_valid
  end

  it "is not valid without a codebase URL" do
    invalid_app = app.dup
    invalid_app.codebase_url = ""
    expect(invalid_app).to_not be_valid
  end

  it "is has a default value 'false' for email_visible" do
    no_email_visible = App.new(name:"foo",description:"blah",url:"blah",codebase_url:"whatever")
    no_email_visible.save!
    expect(no_email_visible.reload.email_visible).to eql(false)
  end

end
