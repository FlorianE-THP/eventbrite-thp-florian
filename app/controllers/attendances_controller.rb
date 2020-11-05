class AttendancesController < ApplicationController
  def new
  end

  def create
    @test = Attendance.create(stripe_customer_id: params[:stripeToken], user_id: session.id, event_id: params[:event_id])

    if @test.save
      redirect_to root_path
    end
  end
end
