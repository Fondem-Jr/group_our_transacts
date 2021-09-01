require 'rails_helper'

RSpec.describe "Transfers", type: :system do
  before(:each) do
    User.create(name: 'User1')
    Group.create(name: 'Group1', user_id: User.where(name: 'User1').first.id)
    Transfer.create(name: 'Euro', amount: 5,
                      user_id: User.where(name: 'User1').first.id, group_id: Group.where(name: 'Group1').first.id)
    driven_by(:rack_test)
  end

  it 'Login is required' do
    visit transfers_path
    expect(page).to have_content('LOGIN')
  end

  it 'renders a new transfer page' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    visit new_transfer_url
    expect(page).to have_content 'New Transfer'
  end

  it 'Logged user can go to see all transfers' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    visit transfers_path
    expect(page).to have_content('Euro')
  end

  it 'can create a new transfer' do
    visit root_path
    fill_in 'Name', with: 'User1'
    click_button 'Login'
    visit transfers_path
    click_link('New Transfer')
    fill_in 'Amount', with: 50
    click_button 'Create Transfer'
    expect(page).to have_content('Transfer was successfully created.')
  end
end
