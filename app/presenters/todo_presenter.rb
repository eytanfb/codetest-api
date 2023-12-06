class TodoPresenter < ApplicationPresenter
  def initialize(todo)
    @todo = todo
  end

  def present
    {
      id: @todo.id,
      description: @todo.description,
      done: @todo.done
    }
  end
end
