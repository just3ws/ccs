user = User.find_or_create_by_email("admin@chicagocodecamp.com")
user.first_name = "admin"
user.last_name = "person"
user.password = "p@ssw0rd"
user.password_confirmation = "p@ssw0rd"
user.role = "admins"
user.save!

user = User.find_or_create_by_email("speaker@chicagocodecamp.com")
user.first_name = "speaker"
user.last_name = "person"
user.password = "p@ssw0rd"
user.password_confirmation = "p@ssw0rd"
user.role = "speakers"
user.save!

feature = Feature.find_or_initialize_by_name("preregistrations")
feature.enabled = false
feature.save!

feature = Feature.find_or_initialize_by_name("image_logo")
feature.enabled = false
feature.save!

feature = Feature.find_or_initialize_by_name("show_sponsors")
feature.enabled = true
feature.save!

sl = SponsorshipLevel.find_or_initialize_by_name("ruby")
sl.priority = 1
sl.save!

sl = SponsorshipLevel.find_or_initialize_by_name("quartz")
sl.priority = 2
sl.save!

