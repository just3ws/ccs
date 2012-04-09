ActiveAdmin.register Submission do


  index do
    column :version_tag
    column :title
    column :abstract
    column "Submitter" do |submission|
      "#{submission.user.last_name}, #{submission.user.first_name}"
    end
    column "Email" do |submission|
      submission.user.email
    end
  end
end
