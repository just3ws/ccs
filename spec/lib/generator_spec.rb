require 'spec/spec_helper'

describe Generator do
  it "generates a 20 character string" do
    Generator.password.length.should == 20
  end

  it "generates a N character string" do
    N = rand(20)
    Generator.password(N).length.should == N
  end
end
