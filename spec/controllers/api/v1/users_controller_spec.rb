require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double Doorkeeper::AccessToken, acceptable?: true, resource_owner_id: user.id }

  before :each do
    allow(controller).to receive(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    it 'returns a collection of users' do
      get :index

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/users/index'
    end
  end

  describe 'GET show' do
    it 'returns a users' do
      get :show, id: user.id

      expect(json['id']).to eq user.id
      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/users/show'
    end
  end

  describe 'POST create' do
    it 'creates a user' do
      post :create, user: FactoryGirl.attributes_for(:user)

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/users/create'
    end
  end

  describe 'PUT update' do
    it 'updates a user' do
      put :update, id: user.id, user: FactoryGirl.attributes_for(:user)

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/users/update'
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a user' do
      delete :destroy, id: user.id

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/users/destroy'
    end
  end
end
