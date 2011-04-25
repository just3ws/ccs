require 'spec_helper'

describe "time_slots/show.html.erb" do
  before(:each) do
    @time_slot = assign(:time_slot, stub_model(TimeSlot,
      :title => "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
  end
end
