require 'spec_helper'

describe "features/edit.html.erb" do
  before(:each) do
    @feature = assign(:feature, stub_model(Feature,
      :name => "MyString",
      :enabled => false,
      :description => "MyString"
    ))
  end

  it "renders the edit feature form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => features_path(@feature), :method => "post" do
      assert_select "input#feature_name", :name => "feature[name]"
      assert_select "input#feature_enabled", :name => "feature[enabled]"
      assert_select "input#feature_description", :name => "feature[description]"
    end
  end
end
