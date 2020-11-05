class PicturesController < ApplicationController
  def create
    @user = current_user
    @user.picture.attach(params[:picture])
    redirect_to user_path(@user)
  end
end
