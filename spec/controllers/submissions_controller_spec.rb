require 'spec_helper'

describe SubmissionsController do
  include Devise::TestHelpers

  context "#create" do
    context "with unregistered email" do
      #it "creates user and associates new submissions" do
        #Generator.stub!(:password).and_return("secret")

        #example_user = Factory(:speaker)

        #controller.
          #should_receive(:find_or_initialize_user_with).
          #with("email" => "a_user@just3ws.com").
          #and_return(example_user)

        #post :create, {:user => {:email => "a_user@just3ws.com"}}
        #response.should be_success
      #end
    end

    # context "with a pre-existing user" do
    #   context "user not logged in" do
    #     it "is unauthorized" do
    #       pending
    #       User.stub!(:find_by_email).with("speaker@just3ws.com").and_return(Factory(:speaker))
    #       post :create, {:user => {:email => "speaker@just3ws.com"}}
    #     end
    #   end
    # end
  end
end
