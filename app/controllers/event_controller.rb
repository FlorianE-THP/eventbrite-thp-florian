class EventController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

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
                              "organizer_id" => current_user.id)

    if @new_event.save
      redirect_to event_path(@new_event.id)
    end
  end

  def show
    @event = Event.find(params[:id])
    @end_date = @event.start_date + (@event.duration * 60)
  end
end
