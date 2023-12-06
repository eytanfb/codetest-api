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

  describe 'callbacks' do
    describe 'after_create' do
      it 'sets the default value of done to false' do
        todo = Todo.create(description: 'Buy milk')
        expect(todo.done).to be(false)
      end
    end
  end

  describe '#complete' do
    it 'marks the todo as done' do
      todo = Todo.new
      todo.complete
      expect(todo.done).to be(true)
    end
  end

  describe '#to_json' do
    it 'returns a JSON representation of the todo' do
      todo = Todo.new(description: 'Buy milk', done: false)

      actual = todo.to_json

      expected = {
        id: todo.id,
        description: 'Buy milk',
        done: false
      }.to_json

      expect(actual).to eq(expected)
    end
  end
end
