require 'spec_helper'

describe NotificationsController do

  describe "GET 'speaker_notification'" do
    it "should be successful" do
      get 'speaker_notification'
      response.should be_success
    end
  end

end
