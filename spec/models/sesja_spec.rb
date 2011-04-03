require 'spec_helper'

describe Sesja do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: sesjas
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  abstract   :text
#  level      :integer
#  keywords   :string(255)
#  accepted   :boolean         default(FALSE)
#  mailed     :boolean         default(FALSE)
#  rsvped     :boolean         default(FALSE)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

