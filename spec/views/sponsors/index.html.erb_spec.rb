require 'spec_helper'

describe "sponsors/index.html.erb" do
  before(:each) do
    assign(:sponsors, [
      stub_model(Sponsor,
        :name => "Name",
        :contact_name => "Contact Name",
        :description => "MyText",
        :home_page => "Home Page",
        :sponsorship_level => nil,
        :email => "Email"
      ),
      stub_model(Sponsor,
        :name => "Name",
        :contact_name => "Contact Name",
        :description => "MyText",
        :home_page => "Home Page",
        :sponsorship_level => nil,
        :email => "Email"
      )
    ])
  end

  it "renders a list of sponsors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Home Page".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
