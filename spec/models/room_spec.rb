require 'spec_helper'

describe Room do
end





# == Schema Information
# Schema version: 20110514114733
#
# Table name: rooms
#
#  id          :integer         primary key
#  title       :string(255)     indexed
#  description :text
#  created_at  :timestamp
#  updated_at  :timestamp
#
# Indexes
#
#  index_rooms_on_title  (title) UNIQUE
#

