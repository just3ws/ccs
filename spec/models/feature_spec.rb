require 'spec_helper'

describe Feature do
  pending "add some examples to (or delete) #{__FILE__}"
end


# == Schema Information
# Schema version: 20110412232659
#
# Table name: features
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  enabled     :boolean         default(FALSE)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_features_on_name  (name) UNIQUE
#

