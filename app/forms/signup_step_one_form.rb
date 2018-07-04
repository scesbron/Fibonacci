class SignupStepOneForm < Rectify::Form
  mimic :user

  attribute :first_name, String
  attribute :last_name, String
  attribute :street_number, String
  attribute :street_name, String
  attribute :zip_code, String
  attribute :city, String
  attribute :email, String
  attribute :password, String

  validates :first_name, :last_name, :street_name, :zip_code, :city, :email, :password, presence: true
  validates :zip_code, zip_code: true
  validates :email, email: true
  validate do
    other = User.find_by(email: email)
    errors.add(:email, :already_used) if other.present? && other.id != id
  end

  def view
    :new_step_1
  end

  def command
    UserCreate
  end
end
