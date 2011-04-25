require 'spec_helper'

describe "schedules/new.html.erb" do
  before(:each) do
    assign(:schedule, stub_model(Schedule,
      :sesja => nil,
      :room => nil,
      :time_slot => nil
    ).as_new_record)
  end

  it "renders new schedule form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => schedules_path, :method => "post" do
      assert_select "input#schedule_sesja", :name => "schedule[sesja]"
      assert_select "input#schedule_room", :name => "schedule[room]"
      assert_select "input#schedule_time_slot", :name => "schedule[time_slot]"
    end
  end
end
