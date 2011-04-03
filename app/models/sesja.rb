class Sesja < ActiveRecord::Base
  belongs_to :user
  scope :displayable, :conditions => {:accepted => true, :rsvped => true}
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

