class LoadUsersFromSubmissions < ActiveRecord::Migration
  def self.up
    say_with_time("pulling users out of submissions into users") do
      require File.expand_path('lib/generator')
      Submission.all.each do |s|
        say "migrating submission #{s.inspect}"
        password = Generator.password
        user = User.find_or_create_by_email s.email
        attributes = s.attributes.slice(:email,
                                        :home_page,
                                        :first_name,
                                        :last_name,
                                        :biography,
                                        :avatar_file_name,
                                        :avatar_content_type,
                                        :avatar_file_size,
                                        :avatar_updated_at)
        attributes.symbolize_keys!
        attributes.merge!(:password => password,
                          :password_confirmation => password)

        user.update_attributes attributes
        say "migrated user #{user.inspect}"
      end
    end
  end

  def self.down
  end
end
