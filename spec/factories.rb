Factory.define :user do |f|
  f.email "a_user@just3ws.com"
  f.password "secret"
  f.password_confirmation "secret"
end

Factory.sequence :email do |n|
  "#{n.ordinalize}_user@just3ws.com"
end

Factory.define :attendee, :parent => :user do |f|
  f.email "attendee@just3ws.com"
  f.role "attendee"
end

Factory.define :speaker, :parent => :user do |f|
  f.email "speaker@just3ws.com"
  f.role "speaker"
end


Factory.define :admin, :parent => :user do |f|
  f.email "admin@just3ws.com"
  f.role "admin"
end

Factory.define :session, :class => Sesja do |f|
  f.title "factory title for session"
  f.abstract "factory abstract for session"
  f.level 1
  f.association :user
end
