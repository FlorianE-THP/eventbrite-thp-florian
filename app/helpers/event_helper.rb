module EventHelper
  def can_join?
    event = Event.find(params[:id])

    if Attendance.where(event_id: current_user.id, event_id: event.id).exists?
      return false
    elsif current_user.id == event.organizer_id
      return false
    else
      true
    end
  end
end
