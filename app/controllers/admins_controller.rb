class AdminsController < ApplicationController
  def portal
    redirect_to admindashboard_path if current_admin
  end
  def dashboard
    current_admin ? @current_admin = current_admin['email'] : redirect_to(adminportal_path)
  end
  def index
    @admins = Admin.all
    @current_admin = current_admin['email']
  end
  def new
    @current_admin = current_admin['email']
    @admin = Admin.new()
  end
  def create
    Admin.create(
      email: params['admin']['email'],
      encrypted_password: params['admin']['password']
    )
    redirect_to admins_path
  end
end
