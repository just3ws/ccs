require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end


# == Schema Information
#
# Table name: comments
#
#  id               :integer         primary key
#  comment          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  email            :string(255)
#  created_at       :timestamp
#  updated_at       :timestamp
#

