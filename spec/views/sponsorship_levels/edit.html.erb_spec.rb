require 'spec_helper'

describe "sponsorship_levels/edit.html.erb" do
  before(:each) do
    @sponsorship_level = assign(:sponsorship_level, stub_model(SponsorshipLevel,
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit sponsorship_level form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sponsorship_levels_path(@sponsorship_level), :method => "post" do
      assert_select "input#sponsorship_level_name", :name => "sponsorship_level[name]"
      assert_select "textarea#sponsorship_level_description", :name => "sponsorship_level[description]"
    end
  end
end
