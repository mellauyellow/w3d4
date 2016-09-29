class Response < ActiveRecord::Base
  validates :respondent_id, :answer_choice_id, presence: true
  validate :respondent_already_answered, :author_responded_to_own_poll

  belongs_to(
  :answer_choice,
  class_name: :AnswerChoice,
  primary_key: :id,
  foreign_key: :answer_choice_id
  )

  belongs_to(
  :respondent,
  class_name: :User,
  primary_key: :id,
  foreign_key: :respondent_id
  )

  has_one :question, through: :answer_choice, source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(respondent_id: self.respondent_id)
  end

  def respondent_already_answered
    errors[:submit_error] << "You already responded" if respondent_already_answered?
  end

  def author_responded_to_own_poll?
    self.question.poll.author_id == self.respondent_id
  end

  def author_responded_to_own_poll
    errors[:submit_error] << "You can't respond to your own poll" if author_responded_to_own_poll?
  end
end
