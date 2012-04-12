ActiveAdmin.register Submission do



  csv do
    column :version_tag
    column :title
    column :abstract
    column "Submitter" do |submission|
      "#{submission.user.last_name}, #{submission.user.first_name}"
    end
    column "Email" do |submission|
      submission.user.email
    end
    column "Bio" do |submission|
      submission.user.biography
    end
  end

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
    column "Bio" do |submission|
      submission.user.biography
    end
  end
end
