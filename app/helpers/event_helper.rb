module EventHelper
  def is_free?
    @event = Event.find(params[:id])
    if @event.price == 0
      return true
    end
  end
end
