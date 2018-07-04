class SignupStepTwoForm < Rectify::Form
  mimic :user

  attribute :situation, Integer
  attribute :pdl, String

  validates :situation, :pdl, presence: true

  def view
    :new_step_2
  end

  def command
    UserComplete
  end
end
