
get '/questions/:id/comments/new' do
  logged_in?
  @question = Question.find(params[:id])

  erb :'comments/new'
end

post '/questions/:id/comments' do

  question = Question.find(params[:id])
  comment = question.comments.build(body: params[:comment_body], author: current_user)

  if comment.save

    redirect "/questions/#{params[:id]}"
  else
     @errors = ["inappropriate comment"]
     erb :'comments/new'
  end
end

get '/answers/:id/comments/new' do
  logged_in?

  @answer = Answer.find(params[:id])

  erb :'comments/new_comment_for_answer'
end

post '/answers/:id/comments' do

  answer = Answer.find(params[:id])
  comment = answer.comments.build(body: params[:comment_body], author: current_user)

  if comment.save
    question_id = answer.question.id
    redirect "/questions/#{question_id}"
  else
     @errors = ["inappropriate comment"]
     erb :'comments/new'
  end
end


