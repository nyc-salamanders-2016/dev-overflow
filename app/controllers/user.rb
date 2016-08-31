get '/users/login' do
  erb :'/users/login'
end

post '/users/login' do
  @user = User.find_by(params[:user])
  if @user && @user.authenticate(params[:password])
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
