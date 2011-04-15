class Feature < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_length_of     :name, :maximum => 32, :allow_nil => false
  validates_length_of     :description, :maximum => 1024, :allow_nil => true

  before_save :format_name

  class << self
    def ok?(feature_name)
      Feature.find_by_name(format_name(feature_name)).try(:enabled?)
    end

    def ok!(feature_name, enabled = false, description = "")
      name = format_name(feature_name)
      feature = Feature.find_or_initialize_by_name(name)
      feature.enabled = !!enabled
      feature.description = description.squish!
      feature.save!
      feature.reload
      feature.enabled?
    end

    def format_name(feature_name)
      feature_name.to_s.downcase.squish.gsub(/(\s|-)/, '_')
    end
  end

  protected

  def format_name
    Feature.format_name(name) if name.present?
  end
end


# == Schema Information
# Schema version: 20110412232659
#
# Table name: features
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  enabled     :boolean         default(FALSE)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_features_on_name  (name) UNIQUE
#

