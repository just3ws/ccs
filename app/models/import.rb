class Import < ActiveRecord::Base
  has_attached_file :csv,
                    :bucket => S3Settings.bucket,
                    :storage => :s3,
                    :s3_credentials => {:access_key_id => ENV['S3_KEY'] || S3Settings.settings[:access_key_id],
                                        :secret_access_key => ENV['S3_SECRET'] || S3Settings.settings[:secret_access_key]},
                    :path => "/:style/:filename"

  validates_attachment_presence :csv
  validates_attachment_content_type :csv,
                                    :content_type => ['text/csv',
                                                      'text/comma-separated-values',
                                                      'text/csv',
                                                      'application/csv',
                                                      'application/excel',
                                                      'application/vnd.ms-excel',
                                                      'application/vnd.msexcel',
                                                      'text/anytext',
                                                      'text/plain']
end



# == Schema Information
#
# Table name: imports
#
#  id               :integer         not null, primary key
#  datatype         :string(255)
#  processed        :integer
#  csv_file_name    :string(255)
#  csv_content_type :string(255)
#  csv_file_size    :integer
#  created_at       :datetime
#  updated_at       :datetime
#

