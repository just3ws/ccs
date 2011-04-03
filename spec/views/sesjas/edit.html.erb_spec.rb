require 'spec_helper'

describe "sesjas/edit.html.erb" do
  before(:each) do
    @sesja = assign(:sesja, stub_model(Sesja,
      :title => "MyString",
      :abstract => "MyText",
      :level => 1,
      :keywords => "MyString",
      :accepted => false
    ))
  end

  it "renders the edit sesja form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sesjas_path(@sesja), :method => "post" do
      assert_select "input#sesja_title", :name => "sesja[title]"
      assert_select "textarea#sesja_abstract", :name => "sesja[abstract]"
      assert_select "input#sesja_level", :name => "sesja[level]"
      assert_select "input#sesja_keywords", :name => "sesja[keywords]"
      assert_select "input#sesja_accepted", :name => "sesja[accepted]"
    end
  end
end
