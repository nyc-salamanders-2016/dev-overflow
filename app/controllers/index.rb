get '/' do
  @recent_posts = Question.all.limit(20)
  erb :index
end
