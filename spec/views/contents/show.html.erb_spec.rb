require 'spec_helper'

describe "contents/show.html.erb" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :title => "Title",
      :body => "MyText",
      :permalink => "Permalink"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Permalink/)
  end
end
