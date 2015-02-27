require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'should have many memberships' do
    should have_many :memberships
  end

  it 'should have many users' do
    should have_many :users
  end

  it 'should have a valid factory' do
    group = FactoryGirl.create :group

    expect(group).to be_valid
  end

  describe 'instance methods' do
    let(:user) { FactoryGirl.create :user }
    let(:group) { FactoryGirl.create :group }

    it 'should be able to see if a user is an owner' do
      group.add_owner user
      expect(group.owner? user).to eq true
    end

    it 'should be able to see if a user is not an owner' do
      expect(group.owner? user).to eq false
    end

    it 'should be able to see if a user is a manager' do
      group.add_user user, Membership::MANAGER
      expect(group.manager? user).to eq true
    end

    it 'should be able to see if a user is not a manager' do
      expect(group.manager? user).to eq false
    end

    it 'should be able to see if a user is a reporter' do
      group.add_user user, Membership::REPORTER
      expect(group.reporter? user).to eq true
    end

    it 'should be able to see if a user is not a reporter' do
      expect(group.reporter? user).to eq false
    end
  end
end
