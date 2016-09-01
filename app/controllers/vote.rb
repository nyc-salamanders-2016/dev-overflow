
post '/questions/:id/voteup' do
  logged_in?
  question = Question.find(params[:id])
  vote = question.votes.build(value: 1, user: current_user).save

  redirect "/questions/#{params[:id]}"
end

post '/questions/:id/votedown' do
  logged_in?
  question = Question.find(params[:id])
  vote = question.votes.build(value: -1, user: current_user).save

  redirect "/questions/#{params[:id]}"
end

post '/answers/:id/voteup' do
  logged_in?
   answer = Answer.find(params[:id])
  vote = answer.votes.build(value: 1, user: current_user).save

  question_id = answer.question.id
  redirect "/questions/#{question_id}"
end

post '/answers/:id/votedown' do
  logged_in?

  answer = Answer.find(params[:id])
  vote = answer.votes.build(value: -1, user: current_user).save

  question_id = answer.question.id
  redirect "/questions/#{question_id}"
end
