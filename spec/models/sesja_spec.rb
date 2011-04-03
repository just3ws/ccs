require 'spec_helper'

describe Sesja do
  describe ".accepted?" do
    it "is not accepted if the date hasn't been set" do
      s = Sesja.new
      s.accepted?.should be_false
    end

    it "is accepted if the date has been set" do
      s = Sesja.new(:accepted_at => DateTime.current)
      s.accepted?.should be_true
    end
  end
  describe ".rsvped?" do
    it "is not rsvped if the date hasn't been set" do
      s = Sesja.new
      s.rsvped?.should be_false
    end

    it "is rsvped if the date has been set" do
      s = Sesja.new(:rsvped_at => DateTime.current)
      s.rsvped?.should be_true
    end
  end

  describe ".mailed?" do
    it "is not mailed if the date hasn't been set" do
      s = Sesja.new
      s.mailed?.should be_false
    end

    it "is mailed if the date has been set" do
      s = Sesja.new(:mailed_at => DateTime.current)
      s.mailed?.should be_true
    end
  end
end

# == Schema Information
#
# Table name: sesjas
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  abstract   :text
#  level      :integer
#  keywords   :string(255)
#  accepted   :boolean         default(FALSE)
#  mailed     :boolean         default(FALSE)
#  rsvped     :boolean         default(FALSE)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

