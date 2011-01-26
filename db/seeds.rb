user = User.find_or_create_by_email("administrator@chicagocodecamp.com")
user.password = "changemenow"
user.password_confirmation = "changemenow"
user.role = "admin"
user.save!
