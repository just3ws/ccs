require 'spec_helper'

describe Translation do
  pending "add some examples to (or delete) #{__FILE__}"
end


# == Schema Information
#
# Table name: translations
#
#  id             :integer         primary key
#  locale         :string(255)
#  key            :string(255)
#  value          :text
#  interpolations :text
#  is_proc        :boolean
#  created_at     :timestamp
#  updated_at     :timestamp
#

