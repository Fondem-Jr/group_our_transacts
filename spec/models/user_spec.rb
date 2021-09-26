require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'User')
  end

  it 'create a new user only if the name is unique' do
    @user.save
    @user1 = User.create(name: @user.name.to_s)
    expect(@user1.valid?).to eq false
  end

  it 'ensures name presence' do
    user = User.new(name: '').save
    expect(user).to eq(false)
  end
  it 'should save successfully a user' do
    user = User.new(name: 'name').save
    expect(user).to eq(true)
  end

  after(:all) { User.destroy_all }
end
