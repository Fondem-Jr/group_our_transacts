require 'rails_helper'

RSpec.describe "Groups", type: :system do
  before(:each) do
    User.create(name: 'User1')
    Group.create(name: 'Group1', user_id: User.where(name: 'User1').first.id)
    driven_by(:rack_test)
  end

  it 'Login is required' do
    visit groups_path
    expect(page).to have_content('LOGIN')
  end

  it 'shows a list of all the created groups' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    visit groups_path
    expect(page).to have_content 'Groups'
  end

  it 'renders a new group page' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    visit new_group_url
    expect(page).to have_content 'New Group'
  end

  it 'Logged user can see all groups' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    visit groups_path
    expect(page).to have_content('Groups')
  end

  it 'User can create a group' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    visit groups_path
    click_link('NEW GROUP')
    fill_in 'Type the name of the group', with: 'Group2'
    click_button 'Create Group'
    expect(page).to have_content('Group was successfully created.')
  end
end
