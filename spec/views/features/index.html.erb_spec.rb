require 'spec_helper'

describe "features/index.html.erb" do
  before(:each) do
    assign(:features, [
      stub_model(Feature,
        :name => "Name",
        :enabled => false,
        :description => "Description"
      ),
      stub_model(Feature,
        :name => "Name",
        :enabled => false,
        :description => "Description"
      )
    ])
  end

  it "renders a list of features" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
