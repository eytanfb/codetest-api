class Todo < ApplicationRecord
  validates :description, presence: true

  def complete
    update(done: true)
  end
end
