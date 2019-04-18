require 'bcrypt'

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
    return 0 unless current_admin
    encrypted_password = BCrypt::Password.create(params['admin']['password'])
    @admin = Admin.new(
      email: params['admin']['email'],
      encrypted_password: encrypted_password
    )
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Episode was successfully created.' }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    return 0 unless current_admin
    Admin.find(params['id']).destroy unless current_admin['id'] == params['id'].to_i
    respond_to do |format|
      format.html { redirect_to admins_path, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end
