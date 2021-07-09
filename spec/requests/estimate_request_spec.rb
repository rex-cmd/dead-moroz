require 'rails_helper'

RSpec.describe 'Estimate', type: :request do
  let(:user) { create(:user) }

  before { sign_in user }

  describe 'POST estimate#create' do
    subject(:estimate_attrs) { attributes_for(:estimate) }

    let(:valid_estimate_params) do
      {
        estimate: {
          value: estimate_attrs[:value],
          comment: estimate_attrs[:comment]
        }
      }
    end

    it "redirects to the user's page" do
      post user_estimates_path(user), params: valid_estimate_params

      expect(response).to redirect_to user
    end

    it 'creates an estimate' do
      expect do
        post user_estimates_path(user), params: valid_estimate_params
      end.to change(Estimate, :count).by(1)
    end
  end

  describe 'DELETE estimate#destroy' do
    subject!(:existing_estimate) { create(:estimate, target: user) }

    it "redirects to the users's page" do
      delete user_estimates_path(user), params: { id: existing_estimate.id }
      expect(response).to redirect_to user
    end

    it 'destroys an estimate' do
      expect do
        delete user_estimates_path(user), params: { id: existing_estimate.id }
      end.to change(Estimate, :count).by(-1)
    end
  end
end