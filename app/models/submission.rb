class Submission < ActiveRecord::Base
  belongs_to :user, autosave: true

  belongs_to :sesja

  # HEY! By using the => syntax VERSION_TAG is used as the default value for new submissions.
  default_scope where(:version_tag => VERSION_TAG).order('submissions.created_at DESC')

  scope :visible, conditions: {deleted_at: nil}
  scope :hidden,  conditions: "submissions.deleted_at IS NOT NULL"
  scope :processed, conditions: "submissions.sesja_id is not null"

  validates :user, presence: true
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
#  version_tag         :string(255)
#

