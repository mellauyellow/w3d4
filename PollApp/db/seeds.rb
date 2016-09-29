# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(user_name: "Andrew_F")
User.create!(user_name: "Melissa_L")

Poll.create!(title: "Hillary or Trump?", author_id: 1)
Poll.create!(title: "Trump or Hillary?", author_id: 1)
Poll.create!(title: "Presidents!", author_id: 2)
Poll.create!(title: "VP?", author_id: 2)

Question.create!(poll_id: 1, text: "Who do you want?")
Question.create!(poll_id: 1, text: "Who wants you?")
Question.create!(poll_id: 2, text: "Who's the best?")
Question.create!(poll_id: 2, text: "Pick one?")
Question.create!(poll_id: 3, text: "Who is your favorite?")
Question.create!(poll_id: 4, text: "Why are you choosing that one?")

AnswerChoice.create!(question_id: 1, text: "Hillary")
AnswerChoice.create!(question_id: 1, text: "Trump")
AnswerChoice.create!(question_id: 2, text: "Clinton")
AnswerChoice.create!(question_id: 2, text: "Donald")
AnswerChoice.create!(question_id: 3, text: "Kaine")
AnswerChoice.create!(question_id: 3, text: "Pence")
AnswerChoice.create!(question_id: 4, text: "Anyone")
AnswerChoice.create!(question_id: 4, text: "Not Trump")

Response.create!(respondent_id: 1, answer_choice_id: 1)
Response.create!(respondent_id: 1, answer_choice_id: 4)
Response.create!(respondent_id: 1, answer_choice_id: 7)
Response.create!(respondent_id: 2, answer_choice_id: 5)
