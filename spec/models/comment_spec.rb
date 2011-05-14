require 'spec_helper'

describe Comment do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
# Schema version: 20110513224421
#
# Table name: comments
#
#  id               :integer         not null, primary key
#  comment          :text
#  commentable_id   :integer
#  commentable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

