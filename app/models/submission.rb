class Submission < ActiveRecord::Base
  belongs_to :user, :autosave => true
  default_scope :order => 'created_at DESC'
  scope :visible, :conditions => {:deleted_at => nil}
  scope :hidden, :conditions => "deleted_at IS NOT NULL"

  validates :user, :presence => true
  validates :title, :presence => true, :length => {:within => 0..64}
  validates :abstract, :presence => true, :length => {:within => 0..1024}
  validates_inclusion_of :level, :in => 0..3
end



# == Schema Information
#
# Table name: submissions
#
#  id                  :integer         not null, primary key
#  email               :string(255)
#  first_name          :string(255)
#  last_name           :string(255)
#  biography           :text
#  title               :string(255)
#  abstract            :text
#  home_page           :string(255)
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime
#  updated_at          :datetime
#  user_id             :integer
#  deleted_at          :datetime
#  level               :integer
#  keywords            :string(255)
#

