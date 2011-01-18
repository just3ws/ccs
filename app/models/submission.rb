class Submission < ActiveRecord::Base
  validates :title, :presence => true
  validates :abstract, :presence => true
  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :home_page, :presence => true
  validates :biography, :presence => true
end
