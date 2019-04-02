require_relative '../helpers/sessions_helper.rb'

class SessionsController < ApplicationController
  include SessionsHelper

  def create
    create_session(admin_lookup_by_params) if admin_lookup_by_params && authenticate_sign_in
    destination = current_admin ? admindashboard_path : adminportal_path
    redirect_to destination
  end

  def delete
    session['admin'] = nil
    redirect_to adminportal_path
  end
end
