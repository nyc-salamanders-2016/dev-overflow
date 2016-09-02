get '/users/new' do
  erb :'users/new'
end

post '/users' do
 user = User.new(params[:user])
  if user.save
    session[:id] = user.id
    redirect '/'
  else
     @errors = user.errors.full_messages
     erb :'users/new'
  end
end

get '/users/login' do

  if request.xhr?
    erb :'/users/login', layout: false

  else
    erb :'/users/login'
  end
end

post '/users/login' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:id] = user.id
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

get '/users/:id/profile' do
  @user = User.find_by(id: params[:id])
  erb :'/users/profile'
end

put '/users/:id' do
  @user = User.find(params[:id])
  if @user.update(params[:user])
    redirect '/'
  else
    erb :'/users/profile'
  end
end
