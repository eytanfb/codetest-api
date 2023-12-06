require 'rails_helper'

describe 'Todos', type: :request do
  describe 'GET /todos' do
    it 'returns all todos' do
      # Create a todo in the database
      todo = Todo.create(description: 'Buy milk', done: false)

      # Make a GET request to the /todos endpoint
      get '/todos'

      # Assert that the response has a 200 HTTP status code
      expect(response).to have_http_status(200)

      # Assert that the response body is a JSON array containing one todo
      expect(response.body).to eq([{
        id: todo.id,
        description: 'Buy milk',
        done: false
      }].to_json)
    end
  end

  describe 'GET /todos/:id' do
    it 'returns a todo' do
      # Create a todo in the database
      todo = Todo.create(description: 'Buy milk', done: false)

      # Make a GET request to the /todos/:id endpoint
      get "/todos/#{todo.id}"

      # Assert that the response has a 200 HTTP status code
      expect(response).to have_http_status(200)

      # Assert that the response body is a JSON object containing the todo
      expect(response.body).to eq({
        id: todo.id,
        description: 'Buy milk',
        done: false
      }.to_json)
    end
  end

  describe 'POST /todos' do
    it 'creates a todo' do
      # Make a POST request to the /todos endpoint
      post '/todos', params: { todo: { description: 'Buy milk', done: false } }

      # Assert that the response has a 201 HTTP status code
      expect(response).to have_http_status(201)

      id = JSON.parse(response.body)['id']

      # Assert that the response body is a JSON object containing the todo
      expect(response.body).to eq({
        id:,
        description: 'Buy milk',
        done: false
      }.to_json)
    end
  end

  describe 'PUT /todos/:id' do
    it 'updates a todo' do
      # Create a todo in the database
      todo = Todo.create(description: 'Buy milk', done: false)

      # Make a PUT request to the /todos/:id endpoint
      put "/todos/#{todo.id}", params: { todo: { description: 'Buy milk', done: true } }

      # Assert that the response has a 200 HTTP status code
      expect(response).to have_http_status(200)

      # Assert that the response body is a JSON object containing the todo
      expect(response.body).to eq({
        id: todo.id,
        description: 'Buy milk',
        done: true
      }.to_json)
    end
  end

  describe 'DELETE /todos/:id' do
    it 'deletes a todo' do
      # Create a todo in the database
      todo = Todo.create(description: 'Buy milk', done: false)

      # Make a DELETE request to the /todos/:id endpoint
      delete "/todos/#{todo.id}"

      # Assert that the response has a 200 HTTP status code
      expect(response).to have_http_status(200)
    end
  end
end
