require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:all) do
    @user = User.create(name: 'User')
  end

  context 'with one created user' do
    before(:each) do
      @group = Group.new(name: 'Group', user_id: @user.id)
    end

    it 'belongs to a user' do
      @group.user_id = nil
      @group.save
      expect(@group.valid?).to eq false
    end

    it 'creates a new group' do
      @group.save
      expect(@group.valid?).to eq(true)
    end

    it 'can not create a group with an empty name' do
      @group1 = Group.create(name: '')
      expect(@group1.valid?).to eq false
    end

    it 'creates a group if the name is unique' do
      @group.save
      @group1 = Group.create(name: @group.name.to_s)
      expect(@group1.valid?).to eq false
    end
  end
end
