class Todo < ApplicationRecord
  validates :description, presence: true

  after_create :set_default_done

  def complete
    update(done: true)
  end

  def set_default_done
    update(done: false)
  end

  def to_json(*_args)
    {
      id:,
      description:,
      done:
    }.to_json
  end
end
