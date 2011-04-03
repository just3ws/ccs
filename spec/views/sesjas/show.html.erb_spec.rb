require 'spec_helper'

describe "sesjas/show.html.erb" do
  before(:each) do
    @sesja = assign(:sesja, stub_model(Sesja,
      :title => "Title",
      :abstract => "MyText",
      :level => 1,
      :keywords => "Keywords",
      :accepted => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Keywords/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
  end
end
