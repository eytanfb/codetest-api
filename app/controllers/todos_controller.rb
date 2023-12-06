class TodosController < ApplicationController
  def index
    todos = Todo.all

    render json: TodosPresenter.new(todos).present
  end

  def show
    todo = Todo.find_by(id: params[:id])

    render json: TodoPresenter.new(todo).present
  end

  def create
    todo = Todo.new(todo_params)
    todo.save!

    render json: TodoPresenter.new(todo).present, status: :created
  end

  def update
    todo = Todo.find_by(id: params[:id])

    todo_params[:done] = todo.done unless todo_params.key?(:done)

    todo.update!(todo_params)

    render json: TodoPresenter.new(todo).present
  end

  def destroy
    todo = Todo.find_by(id: params[:id])
    todo.destroy!

    render json: TodoPresenter.new(todo).present
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :done)
  end
end
