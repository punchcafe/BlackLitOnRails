class AdminsController < ApplicationController
  def portal
  end
  def dashboard
    p session['admin']
    @admin = session['admin']['email']
  end
end
