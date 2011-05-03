require 'spec_helper'

describe Feature do
  pending "add some examples to (or delete) #{__FILE__}"
end





# == Schema Information
#
# Table name: features
#
#  id          :integer         not null, primary key
#  name        :string(32)      indexed
#  enabled     :boolean         default(FALSE)
#  description :string(1024)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_features_on_name  (name) UNIQUE
#

