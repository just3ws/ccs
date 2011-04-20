require 'spec_helper'

describe "sponsors/edit.html.erb" do
  before(:each) do
    @sponsor = assign(:sponsor, stub_model(Sponsor,
      :name => "MyString",
      :contact_name => "MyString",
      :description => "MyText",
      :home_page => "MyString",
      :sponsorship_level => nil,
      :email => "MyString"
    ))
  end

  it "renders the edit sponsor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sponsors_path(@sponsor), :method => "post" do
      assert_select "input#sponsor_name", :name => "sponsor[name]"
      assert_select "input#sponsor_contact_name", :name => "sponsor[contact_name]"
      assert_select "textarea#sponsor_description", :name => "sponsor[description]"
      assert_select "input#sponsor_home_page", :name => "sponsor[home_page]"
      assert_select "input#sponsor_sponsorship_level", :name => "sponsor[sponsorship_level]"
      assert_select "input#sponsor_email", :name => "sponsor[email]"
    end
  end
end
