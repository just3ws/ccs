require 'spec_helper'

describe Content do
  let(:content) {Content.new(:title => "some title", :body => "body text")}
  it "formats the permalink into a SEO friendly string" do
    content.permalink = " and this is my    _permalink_"
    content.save!
    content.reload
    content.permalink.should == "and-this-is-my-permalink"
  end
end



# == Schema Information
#
# Table name: contents
#
#  id         :integer         primary key
#  title      :string(255)
#  body       :text
#  permalink  :string(255)
#  created_at :timestamp
#  updated_at :timestamp
#

