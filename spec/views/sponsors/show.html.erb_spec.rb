require 'spec_helper'

describe "sponsors/show.html.erb" do
  before(:each) do
    @sponsor = assign(:sponsor, stub_model(Sponsor,
      :name => "Name",
      :contact_name => "Contact Name",
      :description => "MyText",
      :home_page => "Home Page",
      :sponsorship_level => nil,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contact Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Home Page/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
