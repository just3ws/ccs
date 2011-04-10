class Content < ActiveRecord::Base
  before_save :seoize_permalink

  protected

  def seoize_permalink
    Formatter.seoize!(self.permalink)
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

