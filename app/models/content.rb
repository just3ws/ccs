class Content < ActiveRecord::Base
  validates_inclusion_of :markup, :in => %(text markdown)
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

