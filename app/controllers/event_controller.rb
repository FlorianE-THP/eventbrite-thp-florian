class EventController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :show, :edit, :destroy, :update]

  def index
    @event = Event.all
  end

  def new
    @new_event = Event.new
  end

  def create
    @new_event = Event.create("start_date" => params[:start_date],
                              "duration" => params[:duration],
                              "title" => params[:title],
                              "description" => params[:description],
                              "location" => params[:location],
                              "price" => params[:price],
                              "organizer_id" => current_user.id,
                              "validated?" => nil)

    if @new_event.save
      redirect_to edit_event_path(@new_event.id)
    end
  end

  def show
    @event = Event.find(params[:id])
    @end_date = @event.start_date + (@event.duration * 60)

    @attendance = Attendance.where(user_id: current_user.id, event_id: @event.id).exists?
  end

  def edit
    @event_edit = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    post_params = params.require(:event).permit(:title, :description, :price, :location, :start_date, :duration, :validated?)
    @event.update(post_params)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def is_validate?
    @event = Event.find(params[:id])
    unless @event.validated? == true
      return true
    end
  end
end
