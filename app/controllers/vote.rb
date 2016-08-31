post '/questions/:id/voteup' do
  question = Question.find(params[:id])
  vote = question.votes.build(value: 1, user: current_user).save

  redirect "/questions/#{params[:id]}"
end

post '/questions/:id/votedown' do
  question = Question.find(params[:id])
  vote = question.votes.build(value: -1, user: current_user).save

  redirect "/questions/#{params[:id]}"
end

post '/answers/:id/voteup' do
   answer = Answer.find(params[:id])
  vote = answer.votes.build(value: 1, user: current_user).save

  question_id = answer.question.id
  redirect "/questions/#{question_id}"
end

post '/answers/:id/votedown' do
   answer = Answer.find(params[:id])
  vote = answer.votes.build(value: -1, user: current_user).save

  question_id = answer.question.id
  redirect "/questions/#{question_id}"
end
