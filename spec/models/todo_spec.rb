require 'rails_helper'

describe Todo, type: :model do
  describe 'attributes' do
    it { should respond_to :description }
    it { should respond_to :done }
  end

  describe 'validations' do
    it 'validates presence of description' do
      todo = Todo.new
      todo.valid?
      expect(todo.errors[:description]).to include("can't be blank")
    end
  end

  describe '#complete' do
    it 'marks the todo as done' do
      todo = Todo.new
      todo.complete
      expect(todo.done).to be(true)
    end
  end
end
