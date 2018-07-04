class EmailValidator < ActiveModel::EachValidator
  EMAIL_REGEXP = /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  def validate_each(record, attribute, value)
    record.errors.add(attribute, :not_a_valid_email) if value !~ EMAIL_REGEXP
  end
end
