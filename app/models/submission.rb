class Submission < ActiveRecord::Base
  validates :title, :presence => true, :length => {:within => 0..64} 
  validates :abstract, :presence => true, :length => {:within => 0..1024}
  validates :email, :presence => true, :length => {:within => 0..255}
  validates :first_name, :presence => true, :length => {:within => 0..255}
  validates :last_name, :presence => true, :length => {:within => 0..255}
  validates :home_page, :presence => true, :length => {:within => 0..512}
  validates :biography, :presence => true, :length => {:within => 0..1024}
  has_attached_file :avatar, 
      :storage => :s3, 
      :path => "/:style/:filename"
end
