require 'spec_helper'

describe "sponsorship_levels/show.html.erb" do
  before(:each) do
    @sponsorship_level = assign(:sponsorship_level, stub_model(SponsorshipLevel,
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
