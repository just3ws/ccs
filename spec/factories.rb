FactoryGirl.define  do
  factory :user do |f|
    f.email "a_user@just3ws.com"
    f.password "secret"
    f.password_confirmation "secret"
  end

  sequence :email do |n|
    "#{n.ordinalize}_user@just3ws.com"
  end

  factory :attendee, :parent => :user do |f|
    f.email "attendee@just3ws.com"
    f.role "attendee"
  end

  factory :speaker, :parent => :user do |f|
    f.email "speaker@just3ws.com"
    f.role "speaker"
  end


  factory  :admin, :parent => :user do |f|
    f.email "admin@just3ws.com"
    f.role "admin"
  end

  factory  :session, :class => Sesja do |f|
    f.title "factory title for session"
    f.abstract "factory abstract for session"
    f.level 1
    f.association :user
  end
end
