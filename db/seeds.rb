user                       = User.find_or_create_by_email("admin@chicagocodecamp.com")
user.password              = "p@ssw0rd"
user.password_confirmation = "p@ssw0rd"
user.role                  = "admin"
user.save!

user                       = User.find_or_create_by_email("speaker@chicagocodecamp.com")
user.password              = "p@ssw0rd"
user.password_confirmation = "p@ssw0rd"
user.role                  = "speaker"
user.save!

