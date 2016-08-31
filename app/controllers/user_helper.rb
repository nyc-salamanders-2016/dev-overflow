def current_user
  User.find_by(session[:id]) || nil
end
