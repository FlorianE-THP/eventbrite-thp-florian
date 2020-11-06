class Admin::EventController < ApplicationController
  # before_action :check_if_admin
  # Methods omitted
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @end_date = @event.start_date + (@event.duration * 60)
  end

  def new
  end

  def create
  end

  def edit
    @event_edit = Event.find(params[:id])
    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition
  end

  def update
    @event_edit = Event.find(params[:id])
    post_params = params.require(:events).permit(:title, :description, :price, :location, :start_date, :duration, :validated?)
    @event_edit.update(post_params)
    redirect_to root_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  private

  def already_verified?
    @event = Event.find(params[:id])
    if @event.validated == false || @event.validated == true
      return true
    end
  end

  def validate
    @event = Event.find(params[:id])
    @event.update(validated: true)
  end

  def unvalidate
    @event = Event.find(params[:id])
    @event.update(validated: false)
  end

  # def check_if_admin
  #   unless current_user.admin?
  #     redirect_to root_path
  #   end
  # end
end
