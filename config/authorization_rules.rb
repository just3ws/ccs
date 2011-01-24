authorization do
  role :guest do
    has_permission_on :submissions, :to => [:create, :new, :show]
  end

  role :speaker do; end

  role :attendee do; end

  role :admin do
    has_omnipotence
  end
end

privileges do
end
