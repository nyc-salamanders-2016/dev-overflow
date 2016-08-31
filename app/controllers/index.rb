get '/' do
  @recent_posts = Question.all.limit(10)
  erb :index
end
