class S3Settings
  def self.settings
    require 'yaml'
    require 'hash'
    if @settings.nil?
      @settings = YAML::load(File.open(File.expand_path(File.join(Rails.root, 'config', 's3.yml'))))[Rails.env]
      if @settings
        @settings = @settings.symbolize_all_keys!
      end
    end
    @settings
  end
end
