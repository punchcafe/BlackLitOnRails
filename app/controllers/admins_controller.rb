class AdminsController < ApplicationController
  def portal
    redirect_to admindashboard_path if session['admin']
  end
  def dashboard
    redirect_to adminportal_path unless session['admin']
    @admin = session['admin']['email'] if session['admin']
  end
end
