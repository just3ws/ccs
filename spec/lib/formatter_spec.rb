require 'spec/spec_helper'

describe Formatter do
  it "formats the permalink into a SEO friendly string" do
    value = " and this is my    _permalink_"
    Formatter.seoize!(value).should == "and-this-is-my-permalink"
  end
end
