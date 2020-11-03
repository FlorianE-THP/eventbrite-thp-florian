class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_good_user?, only: [:show]

  def show
    @event = Event.where(organizer: current_user)
  end

  private

  def is_good_user?
    unless current_user == User.find(params[:id])
      flash[:notice_bad] = "Tu essaie de filouter la"
      redirect_to root_path
    end
  end
end
