class Comment < ActiveRecord::Base
  belongs_to :commentable, :polymorphic => true
  validates_presence_of :comment
  validates_length_of :comment, :in => 1..512, :allow_blank => false 
  validates :email, :presence => true,
    :length => {:within => 0..255},
    :email_domain => true,
    :email_format => true
  default_scope :order => "created_at DESC"
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

