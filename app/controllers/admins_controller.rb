class AdminsController < ApplicationController
  def portal
    redirect_to admindashboard_path if session['admin']
  end
  def dashboard
    p session['admin']
    @admin = session['admin']['email']
  end
end
