class SessionsController < ApplicationController
  def create
    admin = case Admin.where(email: params['email']).length
                      when 1 then Admin.where(email: params['email'])[0]
                      when 0 then false
                      else raise(DatabaseError)
    end
    if admin
      session['admin'] = admin if admin.encrypted_password == params['password']
      p "success" if admin.encrypted_password == params['password']
      p "failure" unless admin.encrypted_password == params['password']
    end
    p 'your session'
    p session['admin']
    destination = session['admin'] ? admindashboard_path : adminportal_path
    redirect_to destination
  end
end
