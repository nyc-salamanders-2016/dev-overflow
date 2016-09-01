get '/questions/new' do
  logged_in?
  erb :'/questions/new'
end

post '/questions' do
  @question = Question.new(params[:question])
    if @question.save
      redirect '/questions/index'
    else
      @errors = @question.errors.full_messages
      erb :'/questions/new'
    end
end

get '/questions' do
  @questions = Question.all
  erb :'/questions/index'
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  @answer = Answer.find_by(params[:user_id])

  erb :'/questions/show'
end

get '/questions/:id/edit' do
  @question = Question.find(params[:id])
  erb :'/questions/edit'
end

put '/questions/:id' do
  @question = Question.find(params[:id])
  @question.assign_attributes(params[:question])
  if @question.save
    redirect '/questions'
  else
    erb :'/questions/edit'
  end
end

delete '/questions/:id' do
  @question = Question.find_by(params[:id])
  @question.destroy
  redirect '/questions'
end
