class Admin::AdminController < ApplicationController
  def index
    @admin = current_user
  end
end
