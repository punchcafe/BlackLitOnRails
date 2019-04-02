module ApplicationHelper
  def current_admin
    return session['admin']
  end
end
