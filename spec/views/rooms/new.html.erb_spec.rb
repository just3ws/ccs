require 'spec_helper'

describe "rooms/new.html.erb" do
  before(:each) do
    assign(:room, stub_model(Room,
      :title => "MyString",
      :description => "MyText"
    ).as_new_record)
  end

  it "renders new room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => rooms_path, :method => "post" do
      assert_select "input#room_title", :name => "room[title]"
      assert_select "textarea#room_description", :name => "room[description]"
    end
  end
end
