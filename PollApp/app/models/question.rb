class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  has_many(
  :answer_choices,
  class_name: :AnswerChoice,
  primary_key: :id,
  foreign_key: :question_id
  )

  belongs_to(
  :poll,
  class_name: :Poll,
  primary_key: :id,
  foreign_key: :poll_id
  )

  has_many :responses, through: :answer_choices, source: :responses

  def results
    results_hash = {}
    answer_choices = self.answer_choices
    answer_choices.each do |choice|
      results_hash[choice.text] = choice.responses.count
    end
    results_hash
  end

  def better_results
    answer_choices = self.answer_choices.includes(:responses)
    results_hash = {}
    answer_choices.each do |choice|
      results_hash[choice.text] = choice.responses.length
    end
    results_hash
  end

  def best_results
    Question
    .joins(:responses)
    .where("answer_choice.question_id = ?", self.id)
    .select("answer_choices.*, COUNT(response.id)")
    .group("answer_choice_id")
  end
end
