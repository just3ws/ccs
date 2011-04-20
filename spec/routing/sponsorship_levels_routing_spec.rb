require "spec_helper"

describe SponsorshipLevelsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/sponsorship_levels" }.should route_to(:controller => "sponsorship_levels", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sponsorship_levels/new" }.should route_to(:controller => "sponsorship_levels", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sponsorship_levels/1" }.should route_to(:controller => "sponsorship_levels", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sponsorship_levels/1/edit" }.should route_to(:controller => "sponsorship_levels", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sponsorship_levels" }.should route_to(:controller => "sponsorship_levels", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/sponsorship_levels/1" }.should route_to(:controller => "sponsorship_levels", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sponsorship_levels/1" }.should route_to(:controller => "sponsorship_levels", :action => "destroy", :id => "1")
    end

  end
end
