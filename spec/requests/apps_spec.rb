require 'spec_helper'

describe "Apps" do
  describe "GET /apps", :type => :feature do
    it "works! (now write some real specs)" do
      get "/apps"
      response.status.should be(200)
    end
  end
end
