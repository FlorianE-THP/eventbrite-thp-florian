class Attendance < ApplicationRecord
  after_create :attendance_send

  def attendance_send
    EventMailer.attendance_email(self.event, self.event.organizer).deliver_now
  end

  belongs_to :event
  belongs_to :user
end
