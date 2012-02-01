#class ImportsController < ApplicationController
  #load_and_authorize_resource

  #def new
    ##@import = Import.new
  #end

  #def create
    ##@import = Import.new(params[:import])

    #respond_to do |format|
      #if @import.save!
        #flash[:notice] = 'CSV data was successfully imported.'
        #format.html { redirect_to(@import) }
      #else
        #flash[:error] = 'CSV data import failed.'
        #format.html { render :action => "new" }
      #end
    #end
  #end

  #def show
    ##@import = Import.find(params[:id])
  #end

  #def proc_csv
    ##@import = Import.find(params[:id])
    #lines = parse_csv_file(@import.csv.path)
    #lines.shift # skip the column headers
    #if lines.size > 0
      #@import.processed = lines.size
      #lines.each do |line|
        #case @import.datatype
          #when "speakers"
            #new_speaker(line)
        #end
      #end
      #@import.save
      #flash[:notice] = "CSV data processing was successful."
      #redirect_to :action => "show", :id => @import.id
    #else
      #flash[:error] = "CSV data processing failed."
      #render :action => "show", :id => @import.id
    #end
  #end

  #private

  #def parse_csv_file(path_to_csv)
    #require 'csv'
    #require 'aws/s3'

    #lines = []

    #s3object = AWS::S3::S3Object.find("original/#{@import.csv_file_name}", S3Settings.bucket)

    #s3object.value.each_line do |line|
      #lines << line.parse_csv({:col_sep => ";"})
    #end

    #lines
  #end

  #def new_speaker(line)
    #email = line[2]
    #user = User.find_or_initialize_by_email(email)
    #if user.invitation_token.blank?
      #attributes = Hash.new
      #attributes[:first_name] = line[0]
      #attributes[:last_name] = line[1]
      #attributes[:email] = email
      #attributes[:home_page] = line[3]
      #attributes[:biography] = line[4]
      #attributes[:role] = "speaker"

      #user.skip_confirmation!
      #user.update_attributes(attributes)
      #user.invite!
    #end
  #end
#end
