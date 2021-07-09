require 'rails_helper'

RSpec.describe 'Authentication', js: true do
  let(:user) { build_stubbed(:user) }
  let(:registered_user) { create(:user) }

  it 'lets a user to sign up' do
    visit root_path
    click_link 'Sign Up'
    within('form') do
      fill_in 'user_first_name',            with: user.first_name
      fill_in 'user_last_name',             with: user.last_name
      fill_in 'user_email',                 with: user.email
      fill_in 'user_address',               with: user.address
      fill_in 'user_birthday',              with: user.birthday
      fill_in 'user_behavior',              with: user.behavior
      fill_in 'user_password',              with: user.password
      fill_in 'user_password_confirmation', with: user.password_confirmation
    end
    click_button 'Sign up'
  end
  it 'lets a signed in user to edit profile' do
    sign_in registered_user
    visit root_path
    click_link('Edit profile')
    within('#edit_user') do
      fill_in 'user_current_password', with: registered_user.password_confirmation
    end
    click_button 'Update'
    expect(page).to have_content 'Your account has been updated'
  end

  it 'lets a signed in user to sign out' do
    sign_in registered_user
    visit root_path
    click_on('Log Out')
    expect(page).to have_content 'Signed out successfully'
  end

  context 'via an invite link' do
    let(:invite) { create(:invitation) }

    it 'lets a use to sign up if valid' do
      visit new_user_registration_path(token: invite.token)
      within('form') do
        fill_in 'user_first_name',            with: user.first_name
        fill_in 'user_last_name',             with: user.last_name
        fill_in 'user_address',               with: user.address
        fill_in 'user_birthday',              with: user.birthday
        fill_in 'user_password',              with: user.password
        fill_in 'user_password_confirmation', with: user.password_confirmation
      end
      click_button 'Sign up'
    end

    it 'shows an error message if invalid' do
      visit new_user_registration_path(token: 'invalid_token')
      expect(page).to have_content 'Invalid token'
    end
  end
end