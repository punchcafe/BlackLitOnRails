class AdminsController < ApplicationController
  def home
    redirect_to new_admin_session_path unless current_admin
    @current_admin = current_admin
  end
end
