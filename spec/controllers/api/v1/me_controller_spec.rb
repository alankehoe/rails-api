require 'rails_helper'

RSpec.describe Api::V1::MeController, type: :controller do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:token) { double :accessible? => true, :resource_owner_id => user.id }

  before :each do
    allow(controller).to receive(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    it 'returns a me object' do
      get :index

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/me/index'
    end
  end

  describe 'PUT update' do
    it 'updates the me object' do
      put :update, user: FactoryGirl.attributes_for(:user)

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/me/update'
    end
  end

  describe 'PUT password' do
    it 'updates the password when everything is correctly supplied' do
      user = FactoryGirl.build :user, password: 'pa55word', password_confirmation: 'pa55word'
      user.save!

      put :password, user: {current_password: 'pa55word', password: 'pa66word', password_confirmation: 'pa66word'}

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/me/password'
    end

    it 'fails when the current password is not supplied' do
      user = FactoryGirl.build :user, password: 'pa55word', password_confirmation: 'pa55word'
      user.save!

      put :password, user: {password: 'pa66word', password_confirmation: 'pa66word'}

      expect(response.status).to eq 400
    end

    it 'fails when the password and confirmation are different' do
      user = FactoryGirl.build :user, password: 'pa55word', password_confirmation: 'pa55word'
      user.save!

      put :password, user: {current_password: 'pa55word', password: 'pa6word', password_confirmation: 'pa66word'}

      expect(response.status).to eq 400
    end

    it 'fails when the current password is incorrect' do
      user = FactoryGirl.build :user, password: 'pa55word', password_confirmation: 'pa55word'
      user.save!

      put :password, user: {current_password: 'pa66word', password: 'pa77word', password_confirmation: 'pa77word'}

      expect(response.status).to eq 400
    end
  end

  describe 'PUT avatar' do
    it 'updates the users avatar when one is supplied' do
      put :avatar, file: fixture_file_upload("#{Rails.root}/spec/fixtures/files/avatar.png", 'image/png')

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/me/avatar'
    end
  end
end
