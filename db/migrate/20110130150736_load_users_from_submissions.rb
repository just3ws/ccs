
class LoadUsersFromSubmissions < ActiveRecord::Migration
  def self.up
    require 'generator'
    Submission.all.each do |s|
      password = Generator.password
      user = User.find_or_create_by_email s.email
      attributes =  s.attributes.slice(:email, 
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
    end
  end

  def self.down
  end
end
