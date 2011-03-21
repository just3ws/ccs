require 'spec_helper'

describe "contents/new.html.erb" do
  before(:each) do
    assign(:content, stub_model(Content,
      :title => "MyString",
      :body => "MyText",
      :permalink => "MyString"
    ).as_new_record)
  end

  it "renders new content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contents_path, :method => "post" do
      assert_select "input#content_title", :name => "content[title]"
      assert_select "textarea#content_body", :name => "content[body]"
      assert_select "input#content_permalink", :name => "content[permalink]"
    end
  end
end
