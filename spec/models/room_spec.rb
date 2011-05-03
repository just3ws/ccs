require 'spec_helper'

describe Room do
  pending "add some examples to (or delete) #{__FILE__}"
end


# == Schema Information
#
# Table name: rooms
#
#  id          :integer         not null, primary key
#  title       :string(255)     indexed
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_rooms_on_title  (title) UNIQUE
#

