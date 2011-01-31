class Submission < ActiveRecord::Base
  belongs_to :user

  validates :title, :presence => true, :length => {:within => 0..64}
  validates :abstract, :presence => true, :length => {:within => 0..1024}
end
