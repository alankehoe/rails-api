require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should have many memberships' do
    should have_many :memberships
  end

  it 'should have many groups' do
    should have_many :groups
  end

  it 'Should have a valid factory' do
    merchant = FactoryGirl.create :user

    expect(merchant).to be_valid
  end

  describe 'Authentication method' do

    let(:user) { FactoryGirl.create :user }

    it 'Should authenticate a user' do
      request = ActionController::TestRequest.new host: 'www.google.ie'
      authenticated = User.authenticate! user.username, user.password, request

      expect(user).to eq authenticated
    end

    it 'Should deny an invalid user' do
      request = ActionController::TestRequest.new host: 'www.google.ie'
      authenticated = User.authenticate! 'alan', 'pa55word', request

      expect(authenticated).to eq false
    end
  end
end
