require 'spec_helper'

describe "rooms/index.html.erb" do
  before(:each) do
    assign(:rooms, [
      stub_model(Room,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Room,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of rooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
