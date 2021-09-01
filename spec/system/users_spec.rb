require 'rails_helper'

RSpec.describe "Users", type: :system do
  before(:each) do
    User.create(name: 'User1')
    driven_by(:rack_test)
  end

  describe 'Login is required' do
    it 'Login is required' do
      visit root_path
      expect(page).to have_content('LOGIN')
    end
  end

  it 'No access for unsigned out' do
    visit root_path.to_s
    expect(page).to_not have_content('Logout')
  end

  it 'Login using an already name registered' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    expect(page).to have_content('Log out')
  end

  it 'User can sign up' do
    visit new_user_url
    fill_in 'Username', with: 'User02'
    click_button 'Create User'
    expect(page).to have_content('User was successfully created')
  end

  it 'Redirects to Home after successufully logged in.' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    expect(page).to have_content('All my transfers')
  end

  it 'Users can log out once they log in successfully' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    click_link('Log out', match: :first)
    expect(page).to have_content('Successfully logged out')
  end
end