class ZipCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, :invalid) if value !~ /\A\d{5}\z/
  end
end
