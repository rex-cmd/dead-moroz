require 'rails_helper'

RSpec.describe 'Gifts', type: :feature, js: true do
  let(:user) { create(:user) }
  let(:gift_attrs) { attributes_for(:gift) }
  let(:gift) {build_stubbed(:gift)}
  before { sign_in user }
 
  it 'can be added' do
    visit root_path
    expect(page).to have_content 'Welcome'
    expect(page).to have_content 'My gifts'
    click_on 'My gifts'
    visit user_gifts_path(user.id)
    expect(page).to have_content 'New gift'
    click_on 'New gift'
    within('form') do
      fill_in 'gift_title',       with: gift_attrs[:title]
      fill_in 'gift_description', with: gift_attrs[:description]
    end
    click_button 'Create'
  end
  context 'when exists' do
    subject!(:gift) { create(:gift, recipient: user, added_by: user) }

    it 'can be edited' do
      visit user_gifts_path(user.id)
      click_on 'Edit'
      within('form') do
        fill_in 'gift_description', with: 'New description'
      end
      click_button 'Save'
      expect(page).to have_content 'Gift was successfully updated'
    end

    it 'can be removed' do
      visit user_gifts_path(user.id)
      click_on 'Delete'
      expect(page).to have_content 'Gift was successfully deleted'
    end
  end
end