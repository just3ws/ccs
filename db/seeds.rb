def line(txt)
  puts "*"*80
  puts txt
  puts "*"*80
end

p "users"
user = User.find_or_create_by_email("admin@just3ws.com")
user.first_name            = "admin"
user.last_name             = "person"
user.password              = "secret"
user.password_confirmation = "secret"
user.role                  = "admins"
user.save!

user = User.find_or_create_by_email("conrad_speaker@just3ws.com")
user.first_name            = "Conrad"
user.last_name             = "Speaker"
user.password              = "secret"
user.password_confirmation = "secret"
user.role                  = "speaker"
user.save!

user = User.find_or_create_by_email("penelope_speaker@just3ws.com")
user.first_name            = "Penelope"
user.last_name             = "Speaker"
user.password              = "secret"
user.password_confirmation = "secret"
user.role                  = "speaker"
user.save!

user = User.find_or_create_by_email("attendee@just3ws.com")
user.first_name            = "attendee"
user.last_name             = "person"
user.password              = "secret"
user.password_confirmation = "secret"
user.role                  = "attendees"
user.save!

line "features"
feature = Feature.find_or_initialize_by_name("preregistrations")
feature.enabled = false
feature.save!

feature = Feature.find_or_initialize_by_name("image_logo")
feature.enabled = true
feature.save!

feature = Feature.find_or_initialize_by_name("show_sponsors")
feature.enabled = true
feature.save!

line "sponsorship levels"
sl = SponsorshipLevel.find_or_initialize_by_name("ruby")
sl.priority = 1
sl.save!

sl = SponsorshipLevel.find_or_initialize_by_name("quartz")
sl.priority = 2
sl.save!

line "sponsors"
sponsor = Sponsor.find_or_initialize_by_name("just3ws, llc")
sponsor.contact_name = "michael d. hall"
sponsor.email = "mdh@just3ws.com"
sponsor.home_page = "http://just3ws.com"
sponsor.sponsorship_level = SponsorshipLevel.find_by_name("ruby")
sponsor.save!

sponsor = Sponsor.find_or_initialize_by_name("Fake Co")
sponsor.contact_name = "chuck l."
sponsor.email = "chuckl@fakecompanywebsite.com"
sponsor.home_page = "http://www.fakecompanywebsite.com"
sponsor.sponsorship_level = SponsorshipLevel.find_by_name("ruby")
sponsor.save!

line "rooms"
room = Room.find_or_initialize_by_title("Room 1")
room.save!

room = Room.find_or_initialize_by_title("Room 2")
room.save!

room = Room.find_or_initialize_by_title("Room 3")
room.save!

line "time slots"
ts = TimeSlot.find_or_initialize_by_title("First Session")
ts.starts_at = DateTime.parse("9:00 AM")
ts.ends_at = ts.starts_at.advance(:minutes => 45)
ts.save!

ts = TimeSlot.find_or_initialize_by_title("Second Session")
ts.starts_at= DateTime.parse("10:00 AM")
ts.ends_at = ts.starts_at.advance(:minutes => 45)
ts.save!

ts = TimeSlot.find_or_initialize_by_title("Third Session")
ts.starts_at= DateTime.parse("11:00 AM")
ts.ends_at= ts.starts_at.advance(:minutes => 45)
ts.save!

line "sessions"

sesja = Sesja.find_or_initialize_by_title("Ruby Presentation")
sesja.abstract = "An introduction to the Ruby language"
sesja.user = User.find_by_email("conrad_speaker@just3ws.com")
sesja.accepted_at = DateTime.now.advance(:minutes => -10)
sesja.rsvped_at = DateTime.now
sesja.level = 1
sesja.save!

sesja = Sesja.find_or_initialize_by_title("CSS Presentation")
sesja.abstract = "A story of styles and selectors"
sesja.user = User.find_by_email("penelope_speaker@just3ws.com")
sesja.accepted_at = DateTime.now.advance(:minutes => -10)
sesja.rsvped_at = DateTime.now
sesja.level = 2
sesja.save!
