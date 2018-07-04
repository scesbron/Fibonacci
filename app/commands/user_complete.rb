class UserComplete < Rectify::Command
  def initialize(form)
    @form = form
  end

  def call
    return broadcast(:invalid) if form.invalid?

    transaction do
      user = form.persisted? ? User.find(form.id) : User.new
      user.assign_attributes(form.attributes)
      user.next
      user.save!
      broadcast(:ok, user)
    end
  end

  private

  attr_reader :form
end
