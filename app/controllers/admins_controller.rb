class AdminsController < ApplicationController
  def portal
    redirect_to admindashboard_path if current_admin
  end
  def dashboard
    current_admin ? @current_admin = current_admin : redirect_to(adminportal_path)
  end
  def index
    @admins = Admin.all
    @current_admin = current_admin
  end
  def new
    @current_admin = current_admin
    @admin = Admin.new()
  end
  def create
    raise('Unauthorized action') unless current_admin
    Admin.create(
      email: params['admin']['email'],
      encrypted_password: params['admin']['password']
    )
    redirect_to admins_path
  end
  def destroy
    raise('Unauthorized action') unless current_admin
    Admin.find(params['id']).destroy unless current_admin['id'] == params['id'].to_i
    redirect_to admins_path
  end
end
