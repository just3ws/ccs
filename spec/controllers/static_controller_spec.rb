require 'spec_helper'

describe StaticController do

  describe "GET 'location'" do
    it "should be successful" do
      get 'location'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
  end

end
