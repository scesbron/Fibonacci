class UserPrevious < Rectify::Command
  def initialize(user)
    @user = user
  end

  def call
    transaction do
      user.previous! if user
      broadcast(:ok)
    end
  end

  private

  attr_reader :user
end
