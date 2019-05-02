require_relative '../helpers/application_helper.rb'

class ApplicationController < ActionController::Base
  include ApplicationHelper

  private

  def set_current_admin
    @current_admin = current_admin
  end

end
