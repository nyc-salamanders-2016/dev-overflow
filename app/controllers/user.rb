get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(username: params[:user])
  if @user && @user.authenticate(params[:user])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = ['Invalid credentials']
    erb :'/users/login'
  end
end

get '/users/logout' do
  session.clear
  redirect '/'
end
