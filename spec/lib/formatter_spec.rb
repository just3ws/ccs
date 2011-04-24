require 'spec/spec_helper'

describe Formatter do
  it "formats the permalink into a SEO friendly string" do
    value = " and this is my    _permalink_"
    Formatter.seoize!(value).should == "and-this-is-my-permalink"
  end

  it "removes non-alphanumerics" do
    value = " so, this is my link! "
    Formatter.seoize!(value).should == "so-this-is-my-link"
  end

  it "tries to preserve hyphenation" do
    value = "and-this-is-my-hyphenated-string"
    Formatter.seoize!(value).should == "and-this-is-my-hyphenated-string"
  end
end

