require 'bcrypt'

module SessionsHelper
  def admin_lookup_by_params
    lookup = Admin.where(email: params['email'])
    case lookup.length
    when 1 then lookup[0]
      when 0 then false
      else raise(DatabaseError)
    end
  end

  def authenticate_sign_in
    salt = ENV['hashsalt'] ? ENV['hashsalt'] : ""
    admin_hash = admin_lookup_by_params.encrypted_password
    return BCrypt::Password.new(admin_hash) == salt + params['password']
  end

  def create_session(admin)
    session['admin'] = admin
  end

end
