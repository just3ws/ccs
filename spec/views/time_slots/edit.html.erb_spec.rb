require 'spec_helper'

describe "time_slots/edit.html.erb" do
  before(:each) do
    @time_slot = assign(:time_slot, stub_model(TimeSlot,
      :title => "MyString"
    ))
  end

  it "renders the edit time_slot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => time_slots_path(@time_slot), :method => "post" do
      assert_select "input#time_slot_title", :name => "time_slot[title]"
    end
  end
end
