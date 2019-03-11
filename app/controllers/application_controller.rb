class ApplicationController < ActionController::Base
  protected
  def after_sign_in_path_for(resource)
    return adminportal_path if resource.class == Admin
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
