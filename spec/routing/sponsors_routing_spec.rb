require "spec_helper"

describe SponsorsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/sponsors" }.should route_to(:controller => "sponsors", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/sponsors/new" }.should route_to(:controller => "sponsors", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/sponsors/1" }.should route_to(:controller => "sponsors", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/sponsors/1/edit" }.should route_to(:controller => "sponsors", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/sponsors" }.should route_to(:controller => "sponsors", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/sponsors/1" }.should route_to(:controller => "sponsors", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/sponsors/1" }.should route_to(:controller => "sponsors", :action => "destroy", :id => "1")
    end

  end
end
