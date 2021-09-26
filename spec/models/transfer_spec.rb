require 'rails_helper'

RSpec.describe Transfer, type: :model do
  current_user = User.first_or_create!(name: 'name')
  let(:group) { Group.create(name: 'Group1', user: current_user) }
  before(:all) do
    @user = User.create(name: 'User')
  end
  subject do
    described_class.new(name: 'Anything',
                        amount: '100')
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without a amount' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'has a name with at least 2 characters long' do
    transfer = Transfer.new(
      name: '',
      user: current_user,
      amount: 20,
      group_id: 1
    )
    expect(transfer).to_not be_valid
  end

  it 'should save a transfer successfully' do
    transfer = Transfer.new(name: 'love',
                            user: current_user,
                            amount: 20,
                            group_id: group.id).save
    expect(transfer).to eq(true)
  end

  context 'test using a created user' do
    before(:each) do
      @transfer = Transfer.new(name: 'Transfer', amount: 10, group_id: group.id, user: current_user)
    end

    it 'creates a new transfer' do
      expect(@transfer).to be_valid
    end

    it 'creates a transfer that does not belong to a group' do
      @transfer = Transfer.new(name: 'Transfer', amount: 10, user: current_user)
      expect(@transfer).to be_valid
    end

    it 'transfer belongs to a user' do
      @transfer.user_id = nil
      @transfer.save
      expect(@transfer.valid?).to eq false
    end
  end

  after(:all) do
    User.destroy_all &
      Group.destroy_all &
      Transfer.destroy_all
  end
end
