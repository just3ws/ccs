atom_feed(:schema_data => @last_updated_at)do |feed|
  feed.title "Chicago Code Camp 2011 Schedule"
  feed.updated @last_updated_at

  @time_slots.each do |time_slot| 
    feed.entry(time_slot) do |entry|
      entry.time_slot(time_slot.title)
      entry.starts_at(time_slot.starts_at)
      entry.ends_at(time_slot.ends_at)

      time_slot.schedules.each do |schedule|
        if schedule.sesja.present?
          entry.session do
            if schedule.sesja.present?
              entry.title(schedule.sesja.title)
              entry.room(schedule.room.title)
              entry.speaker(schedule.sesja.user.full_name)
            end
          end
        end
      end

    end
  end
end
