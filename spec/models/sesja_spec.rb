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
# Schema version: 20110412232659
#
# Table name: sesjas
#
#  id          :integer         primary key
#  title       :string(255)
#  abstract    :text
#  level       :integer
#  keywords    :string(255)
#  user_id     :integer
#  created_at  :timestamp
#  updated_at  :timestamp
#  accepted_at :timestamp
#  mailed_at   :timestamp
#  rsvped_at   :timestamp
#  permalink   :string(255)
#
# Indexes
#
#  index_sesjas_on_title      (title)
#  index_sesjas_on_permalink  (permalink)
#

