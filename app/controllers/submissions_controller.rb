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

  def accept
    require 'ruby-debug'; debugger; puts 'debugger'

    # TODO add an accepted? attribute to the submission
    # TODO add a rejected? attribute to the submission

    id = params[:id]
    # find the submission
    submission = Submission.find_by_id(id)
    fail "Unknown submission id: #{id}" unless submission

    # was it already accepted?
    #return true if submission.accepted?

    # was it already rejected?
    #return true if submission.accepted?

    # is there a sesja already associated with the submission?
    return true if submission.sesja

    # create a sesja from the submission
    sesja = Sesja.new(
      title: submission.title,
      abstract: submission.abstract,
      level: submission.level,
      user_id: submission.user_id,
      accepted_at: DateTime.now)

    sesja.save!


    # associate the submission to the sesja
    submission.sesja_id = sesja.id

    # send acceptance email to the speaker
  end

  def reject
    raise TODO
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
    @submission.user, temporary_password = *(find_or_initialize_user_with params[:user])
    @submission.user.role = "speaker"

    notice =  if temporary_password.nil?
                "Thanks for submitting your proposal. We found a user with the email address #{@submission.user.email} and attached the submission to that account. Please log in to manage your profile and proposals."
              else
                "Thanks for submitting your proposal. Since this is your first proposal we went ahead and generated an account for you and logged you in. Log in with the email you provided and the temporary password '#{temporary_password}'."
              end

    respond_to do |format|
      if @submission.save
        format.html { redirect_to(@submission, :notice => notice) }
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
    user.skip_confirmation! # unless Rails.env == "production"
    user.save!

    if user.errors.blank?
      sign_in user
    end
    [user, password]
  end
end
