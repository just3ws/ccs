require 'spec_helper'

describe "schedules/show.html.erb" do
  before(:each) do
    @schedule = assign(:schedule, stub_model(Schedule,
      :sesja => nil,
      :room => nil,
      :time_slot => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
