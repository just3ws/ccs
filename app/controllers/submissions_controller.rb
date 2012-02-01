class SubmissionsController < ApplicationController
  load_and_authorize_resource

  def index
    respond_to do |format|
      format.html
      format.csv do
        csv_string = CSV.generate do |csv|
          csv << ["title", "abstract", "full_name", "level", "keywords", "biography", "home_page", "email" ]
          @submissions.visible.each do |s|
            begin
              csv << [s.title, s.abstract, s.user.full_name, s.level, s.keywords, s.user.biography, s.user.home_page, s.user.email ]
            rescue Exception => e
              logger.error "Couldn't add the row to the submissions csv: '#{e.inspect}'"
            end
          end
        end
        send_data csv_string, :type => "application/vnd.ms-excel", :filename=>"submissions.csv", :disposition => 'attachment'
      end
    end
  end

  def show
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @submission.user = User.new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
  end

  def create
    @submission.user = find_or_initialize_user_with params[:user]
    @submission.user.role = "speaker"

    respond_to do |format|
      if @submission.save
        format.html { redirect_to(@submission, :notice => "Thank you for submitting your proposal. If this is your first submission you should receive a confirmation email.") }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @submission.update_attributes(params[:submission])
        format.html { redirect_to(@submission, :notice => 'Submission was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    # soft-delete
    @submission.update_attributes(:deleted_at => DateTime.now)

    respond_to do |format|
      format.html { redirect_to(submissions_url) }
    end
  end

  private

  def find_or_initialize_user_with(p)
    # use the current user
    return current_user if user_signed_in?

    # lookup the user
    user = User.find_by_email(p[:email])
    return user unless user.nil?

    # make a user
    password = Generator.password
    user = User.create(p.symbolize_keys.merge(:password => password, :password_confirmation => password))
    # delays the sending of confirmations.
    # TODO setup job to send the confirmations using the following command
    # Devise::Mailer.confirmation_instructions(@user).deliver
    user.skip_confirmation! unless Rails.env == "production"

    if user.errors.blank?
      sign_in user
    end
    user
  end
end
