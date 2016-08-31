def current_user
  User.find_by(session[:id]) || nil
end

def logged_in?
  redirect '/users/login' unless current_user
end
