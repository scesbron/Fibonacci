class User < ApplicationRecord
  include Clearance::User
  include AASM

  enum state: {
    creating: 1,
    completing: 2,
    submitted: 3
  }

  enum situation: {
    move_in: 1,
    built_new: 2,
    temporary_access: 3
  }

  aasm column: :state, enum: true do
    state :creating, initial: true
    state :completing
    state :submitted

    event :next do
      transitions from: :completing, to: :submitted, guard: :completing?
      transitions from: :creating, to: :completing, guard: :creating?
    end

    event :previous do
      transitions from: :completing, to: :creating, guard: :completing?
    end
  end
end
