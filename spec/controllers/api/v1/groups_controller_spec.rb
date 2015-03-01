require 'rails_helper'

RSpec.describe Api::V1::GroupsController, type: :controller do
  render_views

  let(:user) { FactoryGirl.create :user }
  let(:group) { FactoryGirl.create :group }
  let(:token) { double Doorkeeper::AccessToken, acceptable?: true, resource_owner_id: user.id }

  before :each do
    allow(controller).to receive(:doorkeeper_token) { token }
    request.accept = 'application/json'
  end

  describe 'GET index' do
    it 'returns the users groups' do
      get :index

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/groups/index'
    end
  end

  describe 'GET show' do
    it 'returns a group if the user is a member' do
      group.add_owner user
      get :show, id: group.id

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/groups/show'
    end

    it 'does not return a group if the user is not a member' do
      get :show, id: group.id

      expect(json['messages']).to include 'You are not a member of this group'
      expect(response.status).to eq 403
    end
  end

  describe 'POST create' do
    it 'creates a group and adds current user as owner' do
      post :create, group: FactoryGirl.attributes_for(:group)

      group = user.groups.first
      expect(group.owner?(user)).to eq true
      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/groups/create'
    end
  end

  describe 'PUT update' do
    it 'updates a group if the user is an owner' do
      group.add_owner user
      put :update, id: group.id, group: FactoryGirl.attributes_for(:group)

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/groups/update'
    end

    it 'can add an avatar to group if the user is a member' do
      group.add_owner user
      put :update, id: group.id, file: fixture_file_upload("#{Rails.root}/spec/fixtures/files/avatar.png", 'image/png')

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/groups/update'
    end

    it 'does not update a group if the user not a member' do
      put :update, id: group.id, group: FactoryGirl.attributes_for(:group)

      expect(json['messages']).to include 'You are not a member of this group'
      expect(response.status).to eq 403
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a group if the user is an owner' do
      group.add_owner user
      delete :destroy, id: group.id

      expect(response.status).to eq 200
      expect(response).to render_template 'api/v1/groups/destroy'
    end

    it 'does not delete a group if the user is a reporter' do
      group.add_user user, Membership::REPORTER
      delete :destroy, id: group.id

      expect(json['messages']).to include 'You must be the group owner'
      expect(response.status).to eq 403
    end

    it 'does not delete a group if the user is a manager' do
      group.add_user user, Membership::MANAGER
      delete :destroy, id: group.id

      expect(json['messages']).to include 'You must be the group owner'
      expect(response.status).to eq 403
    end
  end
end
