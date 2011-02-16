class S3Settings
  class << self
    def settings
      if @settings.blank?
        @settings = YAML::load(File.open(File.expand_path(File.join(Rails.root, 'config', 's3.yml'))))[Rails.env]
        if @settings
          @settings = @settings.symbolize_all_keys!
        end
      end
      @settings
    end

    def access_key_id 
      ENV['S3_KEY'] || settings[:access_key_id]
    end

    def secret_access_key
      ENV['S3_SECRET'] || settings[:secret_access_key]
    end

    def bucket
      ENV['S3_BUCKET'] || settings[:bucket]
    end
  end
end
