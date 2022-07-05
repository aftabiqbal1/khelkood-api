require 'swagger_helper'

RSpec.describe 'api/auth', type: :request do

  describe 'User Auth' do

    path '/auth' do
      post('Create a user') do
        consumes 'application/json'
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            email: { type: :string },
            password: { type: :string },
            password_confirmation: { type: :string },
            name: { type: :string },
            mobile_number: { type: :string },
            city: { type: :string },
            address: { type: :string },
            active_status: { type: :boolean }
          },
          required: [ :email, :password, :name ]
        }
        response(200, 'User created') do
          let(:user) { { email: 'test01@gmail.com', password: '12345678', password_confirmation: "12345678", name: "ahmad" } }
          run_test!
        end

        response(422, 'invalid request') do
          let(:user) { { email: 'test01@gmail.com'} }
          run_test!
        end

        response(422, 'invalid confirmation password') do
          let(:user) { { email: 'test01@gmail.com', password: '12345678', password_confirmation: "xyz"} }
          run_test!
        end
      end
    end
  end
end