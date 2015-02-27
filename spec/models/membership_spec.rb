require 'rails_helper'

RSpec.describe Membership, type: :model do

  it 'should belong to users' do
    should belong_to :user
  end

  it 'should belong to group' do
    should belong_to :group
  end

  it 'Should have a valid factory' do
    membership = FactoryGirl.create :membership

    expect(membership).to be_valid
  end

end
