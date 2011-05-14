class Notifications < ActionMailer::Base
  default :from => "notifications@chicagocodecamp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.speaker_reminder.subject
  #
  def speaker_reminder(resource)
    @resource = resource
    mail :to => "mdh@just3ws.com"
  end
end
