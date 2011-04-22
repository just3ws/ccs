require 'spec_helper'

describe Feature do
  pending "add some examples to (or delete) #{__FILE__}"
end




# == Schema Information
#
# Table name: features
#
#  id          :integer         primary key
#  name        :string(32)      indexed
#  enabled     :boolean         default(FALSE)
#  description :string(1024)
#  created_at  :timestamp
#  updated_at  :timestamp
#
# Indexes
#
#  index_features_on_name  (name) UNIQUE
#

