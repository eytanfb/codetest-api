class TodosPresenter < ApplicationPresenter
  def initialize(todos)
    @todos = todos
  end

  def present
    @todos.map do |todo|
      TodoPresenter.new(todo).present
    end
  end
end
