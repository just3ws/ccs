role = Role.find_or_create_by_title("guest")
role.save!

role = Role.find_or_create_by_title("attendee")
role.save!

role = Role.find_or_create_by_title("speaker")
role.save!

role = Role.find_or_create_by_title("admin")
role.save!

user = User.find_or_create_by_email("administrator@chicagocodecamp.com")
user.password = "changemenow"
user.password_confirmation = "changemenow"
user.save!
user.roles.create(:title => "admin")
