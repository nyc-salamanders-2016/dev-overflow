get '/answers/new' do
  logged_in?
  erb :'answers/new'
end

post '/answers' do
  answer = Answer.new(params[:answer])
  if answer.save
    redirect'/questions/#{params[:answer][:question_id]}'
  else
    @question = Question.find(params[:answer][:question_id])
    @errors = answer.errors.full_messages
    @answer = Answer.all.find_by(params[:question_id]
    erb :'/questions/show'
end


