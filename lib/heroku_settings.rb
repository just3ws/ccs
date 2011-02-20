class HerokuSettings
  class << self
    def settings
      if @settings.blank?
        @settings = YAML::load(File.open(File.expand_path(File.join(Rails.root, 'config', 'heroku.yml'))))[Rails.env]
        if @settings
          @settings = @settings.symbolize_all_keys!
        end
      end
      @settings
    end  

    def load_env_from_config 
      settings[:config].each do |k,v|
        ENV[k.to_s] = v
      end
    end

    def root_url
      ENV['ROOT_URL'] || settings[:root_url] 
    end
  end
end
