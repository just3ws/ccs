atom_feed(:schema_data => @last_updated_at)do |feed|
  feed.title "Chicago Code Camp 2011 Schedule"
  feed.updated @last_updated_at

  @schedules.each_pair do |key, value| 
    value.each do |schedule|
      feed.entry(schedule) do |entry|
        entry.time_slot do
          entry.title(schedule.time_slot.title)
          entry.starts_at(schedule.time_slot.starts_at)
          entry.ends_at(schedule.time_slot.ends_at)
        end

        entry.room do
          entry.title(schedule.room.title)
        end

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
