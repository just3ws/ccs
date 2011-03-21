require 'spec_helper'

describe "contents/index.html.erb" do
  before(:each) do
    assign(:contents, [
      stub_model(Content,
        :title => "Title",
        :body => "MyText",
        :permalink => "Permalink"
      ),
      stub_model(Content,
        :title => "Title",
        :body => "MyText",
        :permalink => "Permalink"
      )
    ])
  end

  it "renders a list of contents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Permalink".to_s, :count => 2
  end
end
