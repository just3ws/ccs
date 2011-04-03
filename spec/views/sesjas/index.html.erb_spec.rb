require 'spec_helper'

describe "sesjas/index.html.erb" do
  before(:each) do
    assign(:sesjas, [
      stub_model(Sesja,
        :title => "Title",
        :abstract => "MyText",
        :level => 1,
        :keywords => "Keywords",
        :accepted => false
      ),
      stub_model(Sesja,
        :title => "Title",
        :abstract => "MyText",
        :level => 1,
        :keywords => "Keywords",
        :accepted => false
      )
    ])
  end

  it "renders a list of sesjas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Keywords".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
