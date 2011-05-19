require 'spec_helper'

describe Feature do
end








# == Schema Information
# Schema version: 20110514114733
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

