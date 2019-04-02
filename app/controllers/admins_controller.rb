class AdminsController < ApplicationController
  def portal
    redirect_to admindashboard_path if current_admin
  end
  def dashboard
    current_admin ? @admin = current_admin['email'] : redirect_to(adminportal_path)
  end
end
