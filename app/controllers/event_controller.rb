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
      redirect_to edit_event_path(@new_event.id)
    end
  end

  def show
    @event = Event.find(params[:id])
    @end_date = @event.start_date + (@event.duration * 60)

    @participation = @event.attendances.find_by(user_id: current_user[:id], event_id: @event.id)
  end

  def edit
    @event_edit = Event.find(params[:id])

    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @event = Event.find(params[:id])
    post_params = params.require(:event).permit(:title, :description, :price, :location, :start_date, :duration)
    @event.update(post_params)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end
end
