# Globalization
I18n.backend.store_translations(:en, :time => { :formats => { :default => "%l:%M" }})

# Feature flags
{ :preregistrations => false,
  :image_logo => true,
  :show_sponsors => true,
  :comments => true,
}.each_pair do |name, is_enabled|
  Feature.find_or_initialize_by_name(name).tap do |f|
    f.enabled =  is_enabled 
    f.save!
  end
end

# Sponsorship Levels
{ :diamond => 1, 
  :gold => 2, 
  :silver => 3, 
  :bronze => 4
}.each_pair do |name, priority|
  SponsorshipLevel.find_or_initialize_by_name(name).tap do |sl|
    sl.priority = priority 
    sl.save!
  end
end

if %w{development staging}.include? Rails.env
  user = User.find_or_create_by_email("admin@just3ws.com")
  user.first_name            = "admin"
  user.last_name             = "person"
  user.password              = "secret"
  user.password_confirmation = "secret"
  user.role                  = "admin"
  user.save!

  user = User.find_or_create_by_email("mdh@just3ws.com")
  user.first_name            = "Michael"
  user.last_name             = "Hall"
  user.password              = "secret"
  user.password_confirmation = "secret"
  user.role                  = "admin"
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
  user.biography             = "Unicorns and Cupcakes"
  user.save!

  user = User.find_or_create_by_email("attendee@just3ws.com")
  user.first_name            = "attendee"
  user.last_name             = "person"
  user.password              = "secret"
  user.password_confirmation = "secret"
  user.role                  = "attendees"
  user.save!

  sponsor = Sponsor.find_or_initialize_by_name("just3ws, llc")
  sponsor.description = "the guy/company who created ccs. find out get the source from <http://github.com/just3ws/ccs/>"
  sponsor.contact_name = "michael d. hall"
  sponsor.email = "mdh@just3ws.com"
  sponsor.home_page = "http://just3ws.com"
  sponsor.sponsorship_level = SponsorshipLevel.find_by_name("diamond")
  sponsor.save!

  sponsor = Sponsor.find_or_initialize_by_name("Fake Co")
  sponsor.contact_name = "chuck l."
  sponsor.email = "chuckl@fakecompanywebsite.com"
  sponsor.home_page = "http://www.fakecompanywebsite.com"
  sponsor.sponsorship_level = SponsorshipLevel.find_by_name("bronze")
  sponsor.save!

  Room.find_or_initialize_by_title("Room 1").tap do |r|
    r.save!
  end

  Room.find_or_initialize_by_title("Room 2").tap do |r|
    r.save!
  end

  Room.find_or_initialize_by_title("Room 3").tap do |r|
    r.save!
  end

  TimeSlot.find_or_initialize_by_title("First Session").tap do |t|
    t.starts_at = DateTime.parse("9:00 AM")
    t.ends_at   = t.starts_at.advance(:minutes => 45)
    t.save!
  end

  TimeSlot.find_or_initialize_by_title("Second Session").tap do |t|
    t.starts_at = DateTime.parse("10:00 AM")
    t.ends_at   = t.starts_at.advance(:minutes => 45)
    t.save!
  end

  TimeSlot.find_or_initialize_by_title("Third Session").tap do |t|
    t.starts_at = DateTime.parse("11:00 AM")
    t.ends_at   = t.starts_at.advance(:minutes => 45)
    t.save!
  end

  Sesja.find_or_initialize_by_title("Ruby Presentation").tap do |s|
    s.abstract = "An introduction to the Ruby language"
    s.user = User.find_by_email("conrad_speaker@just3ws.com")
    s.accepted_at = DateTime.now.advance(:minutes => -10)
    s.rsvped_at = DateTime.now
    s.level = 1
    s.save!
  end

  Sesja.find_or_initialize_by_title("CSS Presentation").tap do |s|
    s.abstract = "A story of styles and selectors"
    s.user = User.find_by_email("penelope_speaker@just3ws.com")
    s.accepted_at = DateTime.now.advance(:minutes => -10)
    s.rsvped_at = DateTime.now
    s.level = 2
    s.save!
  end

  Schedule.find_or_initialize_by_id(1).tap do |s|
    s.room = Room.first
    s.time_slot = TimeSlot.first
    s.sesja = Sesja.first
    s.save!
  end

  Schedule.find_or_initialize_by_id(2).tap do |s|
    s.room = Room.all.second
    s.time_slot = TimeSlot.first
    s.save!
  end

  Schedule.find_or_initialize_by_id(3).tap do |s|
    s.room = Room.all.third
    s.time_slot = TimeSlot.first
    s.save!
  end

  Schedule.find_or_initialize_by_id(4).tap do |s|
    s.room = Room.first
    s.time_slot = TimeSlot.all.second
    s.sesja = Sesja.all.second
    s.save!
  end

  Schedule.find_or_initialize_by_id(5).tap do |s|
    s.room = Room.all.second
    s.time_slot = TimeSlot.all.second
    s.save!
  end

  Schedule.find_or_initialize_by_id(6).tap do |s|
    s.room = Room.all.third
    s.time_slot = TimeSlot.all.second
    s.save!
  end

  Schedule.find_or_initialize_by_id(7).tap do |s|
    s.room = Room.first
    s.time_slot = TimeSlot.all.third
    s.save!
  end

  Schedule.find_or_initialize_by_id(8).tap do |s|
    s.room = Room.all.second
    s.time_slot = TimeSlot.all.third
    s.save!
  end

  Schedule.find_or_initialize_by_id(9).tap do |s|
    s.room = Room.all.third
    s.time_slot = TimeSlot.all.third
    s.save!
  end
end
