get '/answers/new' do
  logged_in?
  erb :'answers/new'
end

post '/questions/:id/answers' do
  question = Question.find(params[:id])
  answer = question.answers.build(params[:answer])
  answer.author = current_user

  if answer.save
    redirect"/questions/#{answer.question.id}"
  else
    @question = Question.find(params[:answer][:question_id])
    @errors = answer.errors.full_messages
    @answer = Answer.all.find_by(params[:question_id])
    erb :'/questions/show'
  end
end

put '/answers/:id' do
  answer = Answer.find(params[:id])

  answer.best_answer = true
  answer.save

  if request.xhr?

    erb :'/questions/_best_answer', layout: false
  else
    redirect "/questions/#{answer.question.id}"
  end
end


