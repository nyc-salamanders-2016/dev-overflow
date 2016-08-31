User.delete_all
Question.delete_all
Answer.delete_all
Comment.delete_all
Vote.delete_all

edwin = User.create(first_name: "Edwin", last_name: "Carbajal", username: "edwin123", email: "edwin@edwin.com", password: "test")
question1 = Question.create(title: "Is this working?", body: "Yes it is.", author: edwin)
answer1 = Answer.create(body: "You got it!", question: question1, author: edwin)
answer1.comments.build(body: "I agree!", author: edwin).save
question1.comments.build(body: "I agree!", author: edwin).save
question1.votes.build(value: 1, user: edwin).save
answer1.votes.build(value: 1, user: edwin).save
