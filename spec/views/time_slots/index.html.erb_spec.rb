require 'spec_helper'

describe "time_slots/index.html.erb" do
  before(:each) do
    assign(:time_slots, [
      stub_model(TimeSlot,
        :title => "Title"
      ),
      stub_model(TimeSlot,
        :title => "Title"
      )
    ])
  end

  it "renders a list of time_slots" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
